IF (EXISTS(Select * from sys.systrigger where LCase(trigger_name) = LCase('Trig_MenuCena_Upd')))
THEN Drop trigger Trig_MenuCena_Upd
END IF

GO

create trigger Trig_MenuCena_Upd after update order 3 on DBA.MenuCena
referencing old as MCOLD new as MCNEW
for each row
begin
  if MCNEW.PoslData = MCOLD.PoslData then // protiv bezkraino zacikliane
    update Menu set PoslData = NOW(*) where MCNEW.MenuStoka = N;
    update MenuCena set PoslData = NOW(*) where MCNEW.N = N
  end if;
  if MCNEW.MenuNomer = 2 then
    update MenuCena set Cena = MCNEW.Cena
      where MenuStoka = MCNEW.MenuStoka
      and MenuNomer = any(select MenuN from MenuSkladN)
  end if; //
  if(MCNEW.MenuNomer = 2 and MCOLD.MenuStoka = MCNEW.MenuStoka) then
    call UpdateMenuCena(MCOLD.MenuStoka,MCNEW.MenuStoka,MCNEW.Cena)
  end if;
  if(MCNEW.MenuNomer <> 2 and MCOLD.MenuStoka = MCNEW.MenuStoka) then
    call UpdateMenuCenaMenuN(MCOLD.MenuStoka,MCNEW.MenuStoka,MCNEW.Cena,MCNEW.MenuNomer)
  end if
// call UpdateMenuCena(MCOLD.MenuStoka,MCNEW.MenuStoka,MCNEW.Cena)
//call ChkPravaEditMenu()
end
--[27.02.2013] nikolai vasilev da se vzema cena  ot Cenorazpis "1"  i da q slaga na tezi cenorazpisi na koda  kojto sa opisani w MenuskladN
