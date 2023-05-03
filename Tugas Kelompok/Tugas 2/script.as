flash.events.MouseEvent;
var jumlahHewan:int = 3;
var totalHewan:int = 9;
var nilaiBenar:int = 0;
var hewanMasuk:int = 0;
var papanScore:scoreMC;

function setup():void
{
    nilaiBenar = 0;
    hewanMasuk = 0;
    // membuat sampah dengan perintah berulang
    for (var i:int = 0; i < jumlahHewan; i++)
    {
        var hewanUdaraMC:hewan_udara = new hewan_udara;
        var hewanAirMC:hewan_air = new hewan_air;
        var hewanDaratMC:hewan_darat = new hewan_darat;
        hewanUdaraMC.x = 50 + Math.random() * 400;
        hewanUdaraMC.y = 50 + Math.random() * 300;
        hewanAirMC.x = 50 + Math.random() * 400;
        hewanAirMC.y = 50 + Math.random() * 300;
        hewanDaratMC.x = 50 + Math.random() * 400;
        hewanDaratMC.y = 50 + Math.random() * 300;
        hewanUdaraMC.awalX = hewanUdaraMC.x;
        hewanUdaraMC.awalY = hewanUdaraMC.y;
        hewanAirMC.awalX = hewanAirMC.x;
        hewanAirMC.awalY = hewanAirMC.y;
        hewanDaratMC.awalX = hewanDaratMC.x;
        hewanDaratMC.awalY = hewanDaratMC.y;
        hewanUdaraMC.gotoAndStop(Math.floor(Math.random() * 3));
        hewanAirMC.gotoAndStop(Math.floor(Math.random() * 3));
        hewanDaratMC.gotoAndStop(Math.floor(Math.random() * 3));
        // memberikan perintah kepada MC sampah dengan mouse
        hewanUdaraMC.addEventListener(MouseEvent.MOUSE_DOWN, tekanMouse);
        hewanUdaraMC.addEventListener(MouseEvent.MOUSE_UP, lepasMouse);
        addChild(hewanUdaraMC);
        hewanAirMC.addEventListener(MouseEvent.MOUSE_DOWN, tekanMouse);
        hewanAirMC.addEventListener(MouseEvent.MOUSE_UP, lepasMouse);
        addChild(hewanAirMC);
        hewanDaratMC.addEventListener(MouseEvent.MOUSE_DOWN, tekanMouse);
        hewanDaratMC.addEventListener(MouseEvent.MOUSE_UP, lepasMouse);
        addChild(hewanDaratMC);
    }
}
function tekanMouse(e:MouseEvent):void
{
    var ob:Object = e.currentTarget;
    ob.startDrag();
}
function lepasMouse(e:MouseEvent):void
{
    var ob:Object = e.currentTarget;
    ob.stopDrag();
    // menghitung jarak dengan movieclip bg air, darat, dan udara
    var jarak1:int = Math.sqrt(
        (ob.x - air.x) * (ob.x - air.x) + (ob.y - air.y) * (ob.y - air.y)
        );
    var jarak2:int = Math.sqrt(
        (ob.x - darat.x) * (ob.x - darat.x) + (ob.y - darat.y) * (ob.y - darat.y)
        );
    var jarak3:int = Math.sqrt(
        (ob.x - udara.x) * (ob.x - udara.x) + (ob.y - udara.y) * (ob.y - udara.y)
        );
    if (jarak1 < 100 || jarak2 < 100 || jarak3 < 100)
    {
        // need to fix this
        if ((ob.currentFrame < 3 && jarak3 < 100) ||
            (ob.currentFrame > 4 && ob.currentFrame < 7 && jarak1 < 100) ||
            (ob.currentFrame > 7 && jarak2 < 100))
        {
            nilaiBenar++;
        }
        hewanMasuk++;
        if (hewanMasuk == totalHewan)
            tampilkanScore();
        // hapus objek
        ob.removeEventListener(MouseEvent.MOUSE_DOWN, tekanMouse);
        ob.removeEventListener(MouseEvent.MOUSE_UP, lepasMouse);
        removeChild(DisplayObject(ob));
    }
    else
    {
        // jika jarak lebih dari 100 sampah kembali ke posisi semula
        ob.x = ob.awalX;
        ob.y = ob.awalY;
    }
}

function tampilkanScore():void
{
    papanScore = new scoreMC;
    papanScore.x = 400;
    papanScore.y = 240;
    papanScore.nilaiBenar.text = String(nilaiBenar);
    papanScore.nilaiSalah.text = String(totalHewan - nilaiBenar);
    // menentukan bintang
    if (nilaiBenar / totalHewan > 0.8)
    {
        papanScore.bintang.gotoAndStop(3);
    }
    else if (nilaiBenar / totalHewan > 0.4)
    {
        papanScore.bintang.gotoAndStop(2);
    }
    else
    {
        papanScore.bintang.gotoAndStop(1);
    }
    // tampilkan papanScore ke layar
    addChild(papanScore);
}
setup();
