/*

Voraussetzungen:

DB: RecoveryModel: Buld oder h�her
LogBackup = LShipping
nur noch JObs f�r Voll und Diffbackup

SQL Server: ab Std .. Agent!

Umgebung: Dom�ne wg Freigaben

Ergebnis: lesbare sekund�re DB   1:N
		allerdings mit time lag , er aber selbstbestimmbar ist

evtl Probleme beim Einrichten
--Zugriffe f�r Agent! 
----> lokale Ordner besitzen imm nur rechte f�r das Konto MSSQLServer
---->svcAgent und svcSQL haben nicht mal Logins







Lokale Sicherung ist schneller als \\

Wiederherstellungsmodel muss mind maasenprotkoliert sein

AUF HV_SQL1
Backup Log auf C:\_BACKUP
					S

Freigabe auf diese Verzeichnis \\HV-SQL1\_BACKUP

Kopierjob
von \\HV-SQL1\_BACKUP   --> C:\_BACKUP (HV_SQL2)
   L								S


   HV-SQL1: schulung\sqlAgent
   HV-SQL2: schulung\sqlAgent

   Witzigerweise sind die Dienstkontenschulung\svc... nicht als Login vorhanden

   Weil der Zugriff lokal immer mit den NT ServerKonten gemacht wird
   M�ssen wir unter anderem dem Konto des Agent der andere Seite ein ZUgriffsrecht geben (Freigabe und NTFS)
   und Vererbung aktivieren

   Ist das Replikat lesef�hig, m��ssen Clients von der DB geworfen werden, wenn ein Restore kommt..

   Um die sekund�re DB produktiv zu schalten:

   restore database DBName 

   Fertig...

   einen Redirect des Users auf den Sekund�ren gibts nicht
*/