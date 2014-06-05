IF (EXISTS(Select * from sys.sysprocedure where LCase(proc_name) = LCase('UpdateMenuCena')))
THEN Drop procedure UpdateMenuCena
END IF

GO

create procedure DBA.UpdateMenuCena(in inMenuStokaOld integer,in @inMenuStoka integer,in Price numeric(12,4))
begin
  declare @MenuN integer;
  update MenuCena set Cena = Price
    where MenuCena.MenuStoka = any(select distinct M.n from Menu as M join MenuCena as MC
      on MC.menustoka = m.n and M.sn = 
	  (select Min(m.sn) from MenuCena as MC join menu as M on M.n = MC.Menustoka and m.n = @InMenuStoka))
	 
end