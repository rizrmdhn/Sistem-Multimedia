import flash.events.Event;
import flash.events.MouseEvent;
import flash.display.MovieClip;

//membuat penyimpan soal dalam bentuk array
var soalAcak:Array;
var jawabAcak:Array;
var drag:Boolean = false;
var jawab:int;
var jawabBenar:int = 0;
var fps:int = 30; //frame per second
var waktu:int = 0;
var waktuGame:int = 30; //waktu permainan dalam detik
var waktuMaks:int = 30;
var gameAktif:Boolean = true;
var hasilMC:MovieClip;

function acakSoal():void {
//fungsi untuk mengacak soal agar tidak muncul soal yang sama
    soalAcak = new Array;
    //membuat bilangan urut dari 1 - 14 (14 adalah jumlah gambar di MC hewanMC)
    for (var i:int = 1; i <= 14; i++) {
        soalAcak.push(i);
    }
    //mengacak soal
    for (i = 0; i < soalAcak.length; i++) {
        var no1:int = Math.floor(Math.random() * soalAcak.length);
        var no2:int = Math.floor(Math.random() * soalAcak.length);
        var temp:int = soalAcak[no1];
        soalAcak[no1] = soalAcak[no2];
        soalAcak[no2] = temp;
    }
}

function acakJawaban():void {
    //mengeset array jawab acak sesuai soal (3 soal)
    jawabAcak = new Array;
    for (var i:int = 0; i < 3; i++) {
        jawabAcak.push(soalAcak[i]);
    }
    //mengacak jawaban
    for (i = 0; i < jawabAcak.length; i++) {
        var no1:int = Math.floor(Math.random() * jawabAcak.length);
        var no2:int = Math.floor(Math.random() * jawabAcak.length);
        var temp:int = jawabAcak[no1];
        jawabAcak[no1] = jawabAcak[no2];
        jawabAcak[no2] = temp;
    }
}

function setup():void {
//atur variabel awal
    jawabBenar = 0;
    waktuGame = waktuMaks;
    gameAktif = true;
    pengaturWaktu.addEventListener(Event.ENTER_FRAME, aturWaktu);
    acakSoal();
    acakJawaban();
    hewan1.gotoAndStop(soalAcak[0]);
    hewan2.gotoAndStop(soalAcak[1]);
    hewan3.gotoAndStop(soalAcak[2]);
    nama1.gotoAndStop(jawabAcak[0]);
    nama2.gotoAndStop(jawabAcak[1]);
    nama3.gotoAndStop(jawabAcak[2]);
//menambahkan listener
    hewan1.addEventListener(MouseEvent.MOUSE_DOWN, tekanMouse);
    hewan2.addEventListener(MouseEvent.MOUSE_DOWN, tekanMouse);
    hewan3.addEventListener(MouseEvent.MOUSE_DOWN, tekanMouse);
}

function tambahGaris(px:int, py:int):void {
    var garis:garisMC = new garisMC;
    garis.x = px;
    garis.y = py;
    garis.addEventListener(Event.ENTER_FRAME, aturGaris);
    addChild(garis);
}

function aturGaris(e:Event):void {
    var ob:Object = e.currentTarget;
//menentukan rotasi berdasarkan posisi mouse ketika drag
    if (drag) {
        var dx:int = mouseX - ob.x;
        var dy:int = mouseY - ob.y;
        var sudut:int = Math.atan2(dy, dx) * 180 / Math.PI;
        var jarak:int = Math.sqrt(dx * dx + dy * dy);
        ob.rotation = sudut;
        ob.scaleX = jarak / 100;
    } else {
        //ketika mouse dilepaskan lakukan deteksi dengan MC nama
        if ((nama1.hitTestPoint(mouseX, mouseY, true) && nama1.currentFrame == jawab) || (nama2.hitTestPoint(mouseX, mouseY, true) && nama2.currentFrame == jawab) || (nama3.hitTestPoint(mouseX, mouseY, true) && nama3.currentFrame == jawab)) {
            //jawaban benar
            jawabBenar++;
            if (jawabBenar >= 3)
                tampilkanHasil(true);
            ob.removeEventListener(Event.ENTER_FRAME, aturGaris);
        } else {
            ob.removeEventListener(Event.ENTER_FRAME, aturGaris);
            removeChild(DisplayObject(ob));
        }
    }
}

function tekanMouse(e:Event):void {
    var ob:Object = e.currentTarget;
    if (!drag && !ob.benar && gameAktif) {
        drag = true;
        jawab = ob.currentFrame;
        tambahGaris(ob.x + 64, ob.y + 64);
    }
}

function lepasMouse(e:MouseEvent):void {
    drag = false;
}

function aturWaktu(e:Event):void {
    if (gameAktif) {
        waktu++;
        if (waktu > fps) {
            waktu = 0;
            waktuGame--;
            if (waktuGame <= 0) {
                //waktu habis
                tampilkanHasil(false);
                pengaturWaktu.removeEventListener(Event.ENTER_FRAME, aturWaktu);
            }
        }
        //tampilkan dalam movieclip pengaturWaktu
        pengaturWaktu.barMC.scaleX = waktuGame / waktuMaks;
    }
}

function tampilkanHasil(menang:Boolean):void {
    gameAktif = false;
    //hasil jika menang
    if (menang) {
        hasilMC = new scoreMC;
        //menentukan bintang
        if (waktuGame / waktuMaks > 0.5) {
            hasilMC.bintang.gotoAndStop(3);
        } else if (waktuGame / waktuMaks > 0.3) {
            hasilMC.bintang.gotoAndStop(2);
        } else {
            hasilMC.bintang.gotoAndStop(1);
        }
    } else {
        hasilMC = new gagalMC;
    }
    hasilMC.x = 400;
    hasilMC.y = 240;
    hasilMC.retryBtn.addEventListener(MouseEvent.CLICK, ulangi);
    addChild(hasilMC);
}

function ulangi(e:MouseEvent):void {
    //menghapus hasil
    hasilMC.retryBtn.addEventListener(MouseEvent.CLICK, ulangi);
    removeChild(hasilMC);
    //menghapus garis yang sudah ada
    while (numChildren > 8) {
        removeChild(getChildAt(numChildren - 1));
    }
    //mengulangi permainan
    setup();
}


stage.addEventListener(MouseEvent.MOUSE_UP, lepasMouse);


setup();
stop();