create procedure DBA.UpdateMenuCena(in inMenuStokaOld integer,@inMenuStoka integer,in Price numeric(12,4))
begin
  declare @MenuN integer;
  set @MenuN=(select Min(m.sn) from MenuCena as MC join menu as M on M.n = MC.Menustoka and m.n = @InMenuStoka);
  for curs1 as "scroll" dynamic scroll cursor for
    select distinct M.n as @MenuNN from Menu as M join MenuCena as MC
       on MC.menustoka = m.n and M.sn = @MenuN do
       
    update MenuCena set Cena = Price
      where MenuCena.MenuStoka = @MenuNN and MenuCena.MenuStoka = inMenuStokaOld end for
end