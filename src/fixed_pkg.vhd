
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package fixed_pkg is
    type sfixed is array(integer range<>) of std_logic;

    function to_signed(arg : sfixed) return signed;
    function to_unsigned(arg : sfixed) return unsigned;

    function to_sfixed(arg : integer; left, right : integer) return sfixed;
    function to_sfixed(arg : integer; ref : sfixed) return sfixed;

    function to_sfixed(arg : real; left, right : integer) return sfixed;
    function to_sfixed(arg : real; ref : sfixed) return sfixed;

    function to_real(arg : sfixed) return real;

    function to_string(arg : sfixed) return string;

    function to_std_logic_vector(arg : sfixed) return std_logic_vector;

    function resize(arg : sfixed; left, right : integer) return sfixed;
    function resize(arg : sfixed; ref : sfixed) return sfixed;

    function is_positive_or_zero(arg : sfixed) return boolean;
    function is_negative(arg : sfixed) return boolean;

    function "abs"(a : sfixed) return sfixed;

    function "-"(a : sfixed) return sfixed;

    function "-"(a, b : sfixed) return sfixed;
    function "-"(a : sfixed; b : integer) return sfixed;

    function "+"(a, b : sfixed) return sfixed;
    function "+"(a : sfixed; b : integer) return sfixed;

    function "*"(a, b : sfixed) return sfixed;
    function "*"(a : sfixed; b : integer) return sfixed;

    function "sra"(a : sfixed; b : natural) return sfixed;
    function "srl"(a : sfixed; b : natural) return sfixed;

    function "="(a, b : sfixed) return boolean;
    function "="(a : sfixed; b : integer) return boolean;

    function "/="(a, b : sfixed) return boolean;
    function "/="(a : sfixed; b : integer) return boolean;

    function ">"(a, b : sfixed) return boolean;
    function ">"(a : sfixed; b : integer) return boolean;

    function ">="(a, b : sfixed) return boolean;
    function ">="(a : sfixed; b : integer) return boolean;

    function "<"(a, b : sfixed) return boolean;
    function "<"(a : sfixed; b : integer) return boolean;

    function "<="(a, b : sfixed) return boolean;
    function "<="(a : sfixed; b : integer) return boolean;
end fixed_pkg;

package body fixed_pkg is

    function maximum(a, b : integer) return integer is
    begin
        if a >= b then
            return a;
        else
            return b;
        end if;
    end maximum;

    function minimum(a, b : integer) return integer is
    begin
        if a <= b then
            return a;
        else
            return b;
        end if;
    end minimum;

    function to_signed(arg : sfixed) return signed is
        constant res : sfixed(arg'length - 1 downto 0) := arg;
    begin
        return signed(res);
    end to_signed;

    function to_unsigned(arg : sfixed) return unsigned is
        constant res : sfixed(arg'length - 1 downto 0) := arg;
    begin
        return unsigned(res);
    end to_unsigned;

    function to_std_logic_vector(arg : sfixed) return std_logic_vector is
        constant res : sfixed(arg'length - 1 downto 0) := arg;
    begin
        return std_logic_vector(res);
    end to_std_logic_vector;

    function to_sfixed(arg : integer; left, right : integer) return sfixed is
        constant s : signed := to_signed(arg, left + 1);
    begin
        return resize(sfixed(s), left, right);
    end to_sfixed;

    function to_sfixed(arg : integer; ref : sfixed) return sfixed is
    begin
        return to_sfixed(arg, ref'left, ref'right);
    end to_sfixed;

    function to_sfixed(arg : real; left, right : integer) return sfixed is
        -- FIXME compute r using the value of arg
        constant r : integer := maximum(right, left - 31);
        constant i : integer := integer(arg * 2.0 ** (-r));
        variable s : signed(left - right downto 0) := (others => '0');
        variable res : sfixed(left downto right);
    begin
        s(left - right downto r - right) := to_signed(i, left + 1 - r);
        res := sfixed(s);
        return res;
    end to_sfixed;

    function to_sfixed(arg : real; ref : sfixed) return sfixed is
    begin
        return to_sfixed(arg, ref'left, ref'right);
    end to_sfixed;

    function to_real(arg : sfixed) return real is
        variable i, l, r : integer;
        variable res : real := 0.0;
    begin
        l := arg'left;
        while l >= arg'right loop
            r := maximum(l - 30, arg'right);
            i := to_integer(to_unsigned(arg(l downto r)));
            res := res + real(i) * 2.0 ** r;
            l := r - 1;
        end loop;
        if is_negative(arg) then
            return res - 2.0 ** (arg'left + 1);
        else
            return res;
        end if;
    end to_real;

    function to_string(arg : sfixed) return string is
        variable res : string(1 to arg'length + 1);
        variable s : string(1 to 3);
        variable c : integer := 1;
    begin
        for i in arg'range loop
            if i = -1 then
                res(c) := '.';
                c := c + 1;
            end if;
            s := std_logic'image(arg(i));
            res(c) := s(2);
            c := c + 1;
        end loop;
        return res;
    end to_string;

    function resize(arg : sfixed; left, right : integer) return sfixed is
        constant el : natural := arg'length + left - arg'left;
        constant e : sfixed := sfixed(resize(to_signed(arg), el));
        constant sgn : std_logic := arg(arg'left);
        variable res : sfixed(left downto right) := (others => '0');
        variable saturate : boolean := false;
    begin
        -- pragma translate off
        assert left >= right
            report "Invalid range order left=" & integer'image(left) & " right=" & integer'image(right)
            severity failure;

        assert left >= arg'right and right <= arg'left
            report "Incompatible source and target ranges"
            severity failure;
        -- pragma translate on
        
        if left < arg'left then
            for i in arg'left - 1 downto left loop
                if arg(i) /= sgn then
                    report "Resizing integer part of " & to_string(arg)
                        & " to " & integer'image(left + 1) & " bits"
                        severity warning;
                    saturate := true;
                    exit;
                end if;
            end loop;
        end if;

        if saturate then
            res := (others => not sgn);
            res(left) := sgn;
        elsif right <= arg'right then
            res(left downto arg'right) := e;
        else
            res(left downto right) := e(e'left downto right - arg'right);
        end if;
        return res;
    end resize;

    function resize(arg : sfixed; ref : sfixed) return sfixed is
    begin
        return resize(arg, ref'left, ref'right);
    end resize;

    function is_positive_or_zero(arg : sfixed) return boolean is
    begin
        return to_X01(arg(arg'left)) = '0';
    end is_positive_or_zero;

    function is_negative(arg : sfixed) return boolean is
    begin
        return to_X01(arg(arg'left)) = '1';
    end is_negative;

    function "abs"(a : sfixed) return sfixed is
    begin
        if is_negative(a) then
            return -a;
        else
            return a;
        end if;
    end "abs";

    function "-"(a : sfixed) return sfixed is
        constant b : signed := resize(to_signed(a), a'length + 1);
        constant res : sfixed(a'left + 1 downto a'right) := sfixed(-b);
    begin
        return resize(res, a);
    end "-";

    function "-"(a, b : sfixed) return sfixed is
        constant l : integer := maximum(a'left, b'left) + 1;
        constant r : integer := minimum(a'right, b'right);
        constant ra : sfixed := resize(a, l, r);
        constant rb : sfixed := resize(b, l, r);
        constant res : sfixed(l downto r) := sfixed(to_signed(ra) - to_signed(rb));
    begin
        return resize(res, l - 1, r);
    end "-";

    function "-"(a : sfixed; b : integer) return sfixed is
    begin
        return a - to_sfixed(b, a);
    end "-";

    function "+"(a, b : sfixed) return sfixed is
        constant l : integer := maximum(a'left, b'left) + 1;
        constant r : integer := minimum(a'right, b'right);
        constant ra : sfixed := resize(a, l, r);
        constant rb : sfixed := resize(b, l, r);
        constant res : sfixed(l downto r) := sfixed(to_signed(ra) + to_signed(rb));
    begin
        return resize(res, l - 1, r);
    end "+";

    function "+"(a : sfixed; b : integer) return sfixed is
    begin
        return a + to_sfixed(b, a);
    end "+";

    function "*"(a, b : sfixed) return sfixed is
        constant res : sfixed(a'left + b'left + 1 downto a'right + b'right) := sfixed(to_signed(a) * to_signed(b));
    begin
        return res;
    end "*";

    function "*"(a : sfixed; b : integer) return sfixed is
    begin
        return a * to_sfixed(b, a);
    end "*";

    function "sra"(a : sfixed; b : natural) return sfixed is
        constant res : sfixed(a'range) := sfixed(shift_right(to_signed(a), b));
    begin
        return res;
    end "sra";

    function "srl"(a : sfixed; b : natural) return sfixed is
        constant res : sfixed(a'range) := sfixed(shift_right(to_unsigned(a), b));
    begin
        return res;
    end "srl";

    function "="(a, b : sfixed) return boolean is
        constant l : integer := maximum(a'left, b'left);
        constant r : integer := minimum(a'right, b'right);
        constant ra : sfixed := resize(a, l, r);
        constant rb : sfixed := resize(b, l, r);
    begin
        return to_signed(ra) = to_signed(rb);
    end "=";

    function "="(a : sfixed; b : integer) return boolean is
    begin
        return a = to_sfixed(b, a);
    end "=";

    function "/="(a, b : sfixed) return boolean is
        constant l : integer := maximum(a'left, b'left);
        constant r : integer := minimum(a'right, b'right);
        constant ra : sfixed := resize(a, l, r);
        constant rb : sfixed := resize(b, l, r);
    begin
        return to_signed(ra) /= to_signed(rb);
    end "/=";

    function "/="(a : sfixed; b : integer) return boolean is
    begin
        return a /= to_sfixed(b, a);
    end "/=";

    function ">"(a, b : sfixed) return boolean is
        constant l : integer := maximum(a'left, b'left);
        constant r : integer := minimum(a'right, b'right);
        constant ra : sfixed := resize(a, l, r);
        constant rb : sfixed := resize(b, l, r);
    begin
        return to_signed(ra) > to_signed(rb);
    end ">";

    function ">"(a : sfixed; b : integer) return boolean is
    begin
        return a > to_sfixed(b, a);
    end ">";

    function ">="(a, b : sfixed) return boolean is
        constant l : integer := maximum(a'left, b'left);
        constant r : integer := minimum(a'right, b'right);
        constant ra : sfixed := resize(a, l, r);
        constant rb : sfixed := resize(b, l, r);
    begin
        return to_signed(ra) >= to_signed(rb);
    end ">=";

    function ">="(a : sfixed; b : integer) return boolean is
    begin
        return a >= to_sfixed(b, a);
    end ">=";

    function "<"(a, b : sfixed) return boolean is
        constant l : integer := maximum(a'left, b'left);
        constant r : integer := minimum(a'right, b'right);
        constant ra : sfixed := resize(a, l, r);
        constant rb : sfixed := resize(b, l, r);
    begin
        return to_signed(ra) < to_signed(rb);
    end "<";

    function "<"(a : sfixed; b : integer) return boolean is
    begin
        return a < to_sfixed(b, a);
    end "<";

    function "<="(a, b : sfixed) return boolean is
        constant l : integer := maximum(a'left, b'left);
        constant r : integer := minimum(a'right, b'right);
        constant ra : sfixed := resize(a, l, r);
        constant rb : sfixed := resize(b, l, r);
    begin
        return to_signed(ra) <= to_signed(rb);
    end "<=";

    function "<="(a : sfixed; b : integer) return boolean is
    begin
        return a <= to_sfixed(b, a);
    end "<=";

end fixed_pkg;
