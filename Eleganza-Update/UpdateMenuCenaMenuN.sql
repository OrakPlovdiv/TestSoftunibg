IF (EXISTS(Select * from sys.sysprocedure where LCase(proc_name) = LCase('UpdateMenuCenaMenuN')))
THEN Drop procedure UpdateMenuCenaMenuN
END IF

GO

create procedure DBA.UpdateMenuCenaMenuN(in inMenuStokaOld integer,in inMenuStoka integer,in Price numeric(12,4),in  InMenuN integer)
begin
  declare @MenuN integer;
  update MenuCena set Cena = Price
    where MenuCena.MenuStoka = any(select distinct M.n from Menu as M join MenuCena as MC
      on MC.menustoka = m.n and M.sn
       = (select Min(m.sn) from MenuCena as MC join menu as M on M.n = MC.Menustoka and m.n = inMenuStoka))and MenuCena.MenuNomer=InMenuN
end