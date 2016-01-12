program pelayanankesehatan;
uses crt;
type
        pasien  = record
        nomer   : longint;
        nama    : string;
        penyakit: string;
        alamat  : string;
        ruangan : string;
        dokter  : string;
end;

var
        arsip   : file of pasien;
        pas     : array [1..100] of pasien;
        pil     : integer;
        i       : integer;
        n       : integer;
        j       : integer;
        temp    : pasien;
        cari    : string;

procedure menu;
begin
clrscr;
        writeln('----------MENU----------');
        writeln('1.Input Data Pasien     ');
        writeln('2.Simpan Data           ');
        writeln('3.Open File             ');
        writeln('4.Urut Sesuai Alamat    ');
        writeln('5.Urut Sesuai Penyakit  ');
        writeln('6.Urut Sesuai Dokter    ');
        writeln('7.Edit Data             ');
        writeln('8.Tambah Data           ');
        writeln('9.Exit                  ');
        writeln('------------------------');
        writeln;
        write('pilihan= ');
readln(pil);
end;

procedure input;
begin
clrscr;
        writeln('--------INPUT DATA PASIEN--------');
        for i:=1 to n do
        begin
                writeln('data ke-' , i);
                write('nama     = '); readln(pas[i].nama);
                write('alamat   = '); readln(pas[i].alamat);
                write('penyakit = '); readln(pas[i].penyakit);
                write('nomer    = '); readln(pas[i].nomer);
                write('dokter   = '); readln(pas[i].dokter);
                write('ruangan  = '); readln(pas[i].ruangan);
        writeln('-----------------------------------');
        end;
readln;
clrscr;
end;

procedure data_output;
begin
clrscr;
        assign(arsip,'pasien.txt');
        reset(arsip);
        writeln('-----berikut data pasien yang telah di inputkan-----');
        i:=1;
                while not EOF(arsip) do
                begin
                read(arsip,pas[i]);
                        writeln('data ke-', i);
                        writeln('nama           = ',pas[i].nama    );
                        writeln('alamat         = ',pas[i].alamat  );
                        writeln('nomer          = ',pas[i].nomer   );
                        writeln('penyakit       = ',pas[i].penyakit);
                        writeln('dokter         = ',pas[i].dokter  );
                        writeln('ruangan        = ',pas[i].ruangan );
                        writeln('----------------------------------');
                        i:=i+1;
                        end;
        close(arsip);
readln;
clrscr;
end;

procedure sort_alamat;
begin
clrscr;
for i:= n downto 1 do
        begin
        for j:=2 to i do
                begin
                if pas[j-1].alamat>pas[j].alamat then
                        begin
                        temp:=pas[j-1];
                        pas[j-1]:=pas[j];
                        pas[j]:=temp;
                        end;
                end;
        end;
        for i := 1 to n do
        begin
        writeln('data ke-', i);
                        writeln('nama           = ',pas[i].nama    );
                        writeln('alamat         = ',pas[i].alamat  );
                        writeln('nomer          = ',pas[i].nomer   );
                        writeln('penyakit       = ',pas[i].penyakit);
                        writeln('dokter         = ',pas[i].dokter  );
                        writeln('ruangan        = ',pas[i].ruangan );
                        writeln('---------------------------------');
                        end;
readln;
end;

procedure sort_penyakit;
begin
clrscr;
for i:= n downto 1 do
        begin
        for j:=2 to i do
                begin
                if pas[j-1].penyakit>pas[j].penyakit then
                        begin
                        temp:=pas[j-1];
                        pas[j-1]:=pas[j];
                        pas[j]:=temp;
                        end;
                end;
        end;
        for i := 1 to n do
        begin
        writeln('data ke-', i);
                        writeln('nama           = ',pas[i].nama    );
                        writeln('alamat         = ',pas[i].alamat  );
                        writeln('nomer          = ',pas[i].nomer   );
                        writeln('penyakit       = ',pas[i].penyakit);
                        writeln('dokter         = ',pas[i].dokter  );
                        writeln('ruangan        = ',pas[i].ruangan );
                        writeln('---------------------------------');
                        end;
readln;
end;

procedure sort_dokter;
begin
clrscr;
for i:= n downto 1 do
        begin
        for j:=2 to i do
                begin
                if pas[j-1].dokter>pas[j].dokter then
                        begin
                        temp:=pas[j-1];
                        pas[j-1]:=pas[j];
                        pas[j]:=temp;
                        end;
                end;
        end;
        for i := 1 to n do
        begin
        writeln('data ke-', i);
                        writeln('nama           = ',pas[i].nama    );
                        writeln('alamat         = ',pas[i].alamat  );
                        writeln('nomer          = ',pas[i].nomer   );
                        writeln('penyakit       = ',pas[i].penyakit);
                        writeln('dokter         = ',pas[i].dokter  );
                        writeln('ruangan        = ',pas[i].ruangan );
                        writeln('---------------------------------');
                        end;
readln;
end;

procedure tulis_arsip;
begin
        assign(arsip,'pasien.txt');
        rewrite(arsip);
                for i:=1 to n do
                begin
                        writeln('data ke-',i);
                        writeln('nama    = ',pas[i].nama);
                        writeln('nomer   = ',pas[i].nomer);
                        writeln('alamat  = ',pas[i].alamat);
                        writeln('penyakit= ',pas[i].penyakit);
                        writeln('ruangan = ',pas[i].ruangan);
                        writeln('dokter  = ',pas[i].dokter);
                        writeln('Data telah tersimpan..!');
                        write(arsip,pas[i]);
                end;
readln;
close(arsip);
end;

procedure edit;
begin
clrscr;
        assign(arsip,'pasien.txt');
        reset(arsip);
        write('masukan nama pasien yang akan di edit= ');
        readln(cari);
        i:=1;
                while  (i<n) and (cari<>pas[i].nama) do
                begin
                        i:=i+1;
                end;
        if cari<>pas[i].nama then
        writeln('data tidak ada')
        else
        begin
        clrscr;
                writeln('ini data pasien yang akan di edit');
                writeln('nama           = ',pas[i].nama);
                write('nomer            = '); readln(pas[i].nomer);
                write('alamat           = '); readln(pas[i].alamat);
                write('penyakit         = '); readln(pas[i].penyakit);
                write('dokter           = '); readln(pas[i].dokter);
                write('ruangan          = '); readln(pas[i].ruangan);
                write(arsip,pas[i]);
                end;
        close(arsip);
readln;
clrscr;
end;

procedure tambah_data;
begin
clrscr;
        n:=n+1;
        writeln('data ke-' ,n);
        write('nama     = '); readln(pas[n].nama);
        write('nomer    = '); readln(pas[n].nomer);
        write('alamat   = '); readln(pas[n].alamat);
        write('penyakit = '); readln(pas[n].penyakit);
        write('dokter   = '); readln(pas[n].dokter);
        write('ruangan  = '); readln(pas[n].ruangan);
readln;
clrscr;
end;

begin
clrscr;
        write('jumlah data= ');
        readln(n);
        writeln;
        repeat
                menu;
                case pil of
                        1 : input;
                        2 : begin
                            tulis_arsip;
                            clrscr;
                            end;
                        3 : data_output;
                        4 : sort_alamat;
                        5 : sort_penyakit;
                        6 : sort_dokter;
                        7 : edit;
                        8 : tambah_data;
                end;
                until (pil=9);
readln;
end.