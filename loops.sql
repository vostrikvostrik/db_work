-- Created on 30.03.2017 by EVOSTRIKOVA 
declare 
  -- Local variables here
  i integer;
  nextValue float;
  str varchar2(100);
begin
  str:='1;2;3;4;5;6;7;8;9;10';
  -- Test statements here
  FOR item IN (
   SELECT regexp_substr(str, '[^;]+', 1, level) numb
     FROM dual
    CONNECT BY instr(str, ';', 1, level - 1) > 0
    
  )
  LOOP
        DBMS_OUTPUT.PUT_LINE('item.numb=' || item.numb);          
    FOR i IN 1..300 LOOP
        nextValue:=trunc(dbms_random.value(1000,9999),2);
        DBMS_RANDOM.TERMINATE; 
        DBMS_OUTPUT.PUT_LINE('i = '||i||'value =' || nextValue);    
    END LOOP;    
      
  END LOOP;
end;
