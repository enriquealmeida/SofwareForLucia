FasdUAS 1.101.10   ��   ��    k             l     ��  ��    9 3 Copyright � 2010-2012 Artech. All rights reserved.     � 	 	 f   C o p y r i g h t   �   2 0 1 0 - 2 0 1 2   A r t e c h .   A l l   r i g h t s   r e s e r v e d .   
  
 l     ��������  ��  ��        j     �� �� 20 pinvalidparameterserror pInvalidParametersError  m        �   6 I n v a l i d   s c r i p t   p a r a m e t e r s :        j    �� �� 40 pappversionnotfounderror pAppVersionNotFoundError  m       �   R N e e d e d   x C o d e   v e r s i o n   ( 4 . x )   n o t   i n s t a l l e d .      j    �� �� *0 papprequiredversion pAppRequiredVersion  m       �    4 .      l     ��������  ��  ��        i   	      I     �� !��
�� .aevtoappnull  �   � **** ! o      ���� 0 argv  ��     k     x " "  # $ # r      % & % m      ' ' � ( ( � / U s e r s / c r i s t i a n / D o c u m e n t s 2 / P r o j e c t s / B l o o d P r e s s u r e / M a i n M e n u / M a i n M e n u . x c o d e p r o j & o      ���� 0 testproj testProj $  ) * ) l   �� + ,��   + > 8set argv to {"launch", testProj, "iphoneos4.3", "Debug"}    , � - - p s e t   a r g v   t o   { " l a u n c h " ,   t e s t P r o j ,   " i p h o n e o s 4 . 3 " ,   " D e b u g " } *  . / . l   �� 0 1��   0 2 ,set argv to {"activate", "iPhone Simulator"}    1 � 2 2 X s e t   a r g v   t o   { " a c t i v a t e " ,   " i P h o n e   S i m u l a t o r " } /  3 4 3 l   ��������  ��  ��   4  5 6 5 Z     7 8���� 7 =    9 : 9 l   	 ;���� ; I   	�� <��
�� .corecnte****       **** < o    ���� 0 argv  ��  ��  ��   : m   	 
����   8 R    �� =��
�� .ascrerr ****      � **** = b     > ? > o    ���� 20 pinvalidparameterserror pInvalidParametersError ? m     @ @ � A A * c o m m a n d   n o t   s p e c i f i e d��  ��  ��   6  B C B l   ��������  ��  ��   C  D E D r    $ F G F I    "�������� 0 get_xcodeapp get_XCodeApp��  ��   G o      ���� 0 xcodeapp xcodeApp E  H�� H Z   % x I J K L I =  % + M N M n   % ) O P O 4   & )�� Q
�� 
cobj Q m   ' (����  P o   % &���� 0 argv   N m   ) * R R � S S  l a u n c h J k   . I T T  U V U I   . 5�� W���� 0 check_parameters_count   W  X Y X o   / 0���� 0 argv   Y  Z�� Z m   0 1���� ��  ��   V  [�� [ L   6 I \ \ I   6 H�� ]���� 0 	do_launch   ]  ^ _ ^ o   7 8���� 0 xcodeapp xcodeApp _  ` a ` n   8 < b c b 4   9 <�� d
�� 
cobj d m   : ;����  c o   8 9���� 0 argv   a  e f e n   < @ g h g 4   = @�� i
�� 
cobj i m   > ?����  h o   < =���� 0 argv   f  j�� j n   @ D k l k 4   A D�� m
�� 
cobj m m   B C����  l o   @ A���� 0 argv  ��  ��  ��   K  n o n =  L R p q p n   L P r s r 4   M P�� t
�� 
cobj t m   N O����  s o   L M���� 0 argv   q m   P Q u u � v v  a c t i v a t e o  w�� w k   U f x x  y z y I   U \�� {���� 0 check_parameters_count   {  | } | o   V W���� 0 argv   }  ~�� ~ m   W X���� ��  ��   z  ��  I   ] f�� ����� 0 do_activate   �  ��� � n   ^ b � � � 4   _ b�� �
�� 
cobj � m   ` a����  � o   ^ _���� 0 argv  ��  ��  ��  ��   L R   i x�� ���
�� .ascrerr ****      � **** � b   k w � � � b   k r � � � o   k p���� 20 pinvalidparameterserror pInvalidParametersError � m   p q � � � � �   u n k n o w n   c o m m a n d   � n   r v � � � 4   s v�� �
�� 
cobj � m   t u����  � o   r s���� 0 argv  ��  ��     � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� 0 check_parameters_count   �  � � � o      ���� 0 argv   �  ��� � o      ���� 0 requiredcount requiredCount��  ��   � Z      � ����� � >     � � � l     ����� � I    �� ���
�� .corecnte****       **** � o     ���� 0 argv  ��  ��  ��   � o    ���� 0 requiredcount requiredCount � R   
 �� ���
�� .ascrerr ****      � **** � b     � � � b     � � � o    ���� 20 pinvalidparameterserror pInvalidParametersError � m     � � � � � V i n c o r r e c t   n u m b e r   o f   p a r a m e t e r s   f o r   c o m m a n d   � n     � � � 4    �� �
�� 
cobj � m    ����  � o    ���� 0 argv  ��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � j    �� ��� "0 plsregisterpath pLSRegisterPath � m     � � � � � � / S y s t e m / L i b r a r y / F r a m e w o r k s / C o r e S e r v i c e s . f r a m e w o r k / V e r s i o n s / A / F r a m e w o r k s / L a u n c h S e r v i c e s . f r a m e w o r k / V e r s i o n s / A / S u p p o r t / l s r e g i s t e r �  � � � l     ��������  ��  ��   �  � � � i     � � � I      �� ����� &0 getappwithversion getAppWithVersion �  � � � o      ���� 0 appbundleid appBundleID �  � � � o      ���� (0 apprequiredversion appRequiredVersion �  ��� � o      ���� 20 appversionnotfounderror appVersionNotFoundError��  ��   � k     f � �  � � � r      � � � n      � � � 2    ��
�� 
cpar � l     ����� � I    �� ���
�� .sysoexecTEXT���     TEXT � b      � � � b     	 � � � b      � � � o     ���� "0 plsregisterpath pLSRegisterPath � m     � � � � � D   - d u m p   |   g r e p   - - b e f o r e - c o n t e x t = 3   " � o    ���� 0 appbundleid appBundleID � m   	 
 � � � � � R "   |   g r e p   - - o n l y - m a t c h i n g   " / . * / X c o d e \ . a p p "��  ��  ��   � o      ���� 0 theapppaths theAppPaths �  � � � l   �������  ��  �   �  � � � r     � � � m    �~
�~ 
msng � o      �}�} 0 theapp theApp �  � � � X    T ��| � � Q   ( O � ��{ � k   + F � �  � � � r   + 3 � � � n   + 1 � � � 1   / 1�z
�z 
vers � 4   + /�y �
�y 
capp � o   - .�x�x 0 
theapppath 
theAppPath � o      �w�w 0 	theappver 	theAppVer �  � � � l  4 4�v � ��v   � ( "log theAppVer & " - " & theAppPath    � � � � D l o g   t h e A p p V e r   &   "   -   "   &   t h e A p p P a t h �  ��u � Z   4 F � ��t�s � C   4 7 � � � o   4 5�r�r 0 	theappver 	theAppVer � o   5 6�q�q (0 apprequiredversion appRequiredVersion � k   : B � �  � � � r   : @ � � � 4   : >�p �
�p 
capp � o   < =�o�o 0 
theapppath 
theAppPath � o      �n�n 0 theapp theApp �  ��m �  S   A B�m  �t  �s  �u   � R      �l�k�j
�l .ascrerr ****      � ****�k  �j  �{  �| 0 
theapppath 
theAppPath � o    �i�i 0 theapppaths theAppPaths �  � � � l  U U�h�g�f�h  �g  �f   �  � � � Z   U c � ��e�d � =   U X � � � o   U V�c�c 0 theapp theApp � m   V W�b
�b 
msng � R   [ _�a ��`
�a .ascrerr ****      � **** � o   ] ^�_�_ 20 appversionnotfounderror appVersionNotFoundError�`  �e  �d   �  � � � l  d d�^�]�\�^  �]  �\   �  ��[ � L   d f   o   d e�Z�Z 0 theapp theApp�[   �  l     �Y�X�W�Y  �X  �W    i     I      �V�U�T�V 0 get_xcodeapp get_XCodeApp�U  �T   L      I     �S�R�S &0 getappwithversion getAppWithVersion 	
	 m     � $ c o m . a p p l e . * \ . X c o d e
  o    �Q�Q *0 papprequiredversion pAppRequiredVersion �P o    �O�O 40 pappversionnotfounderror pAppVersionNotFoundError�P  �R    l     �N�M�L�N  �M  �L    i     I      �K�J�I�K 00 get_iphonesimulatorapp get_iPhoneSimulatorApp�J  �I   L      I     �H�G�H &0 getappwithversion getAppWithVersion  m     � 2 c o m . a p p l e . i p h o n e s i m u l a t o r  o    �F�F *0 papprequiredversion pAppRequiredVersion �E o    �D�D 40 pappversionnotfounderror pAppVersionNotFoundError�E  �G     l     �C�B�A�C  �B  �A    !"! i     ##$# I      �@%�?�@ 0 set_sdk_config  % &'& o      �>�> 0 xcodeapp xcodeApp' ()( o      �=�= 0 project_path  ) *+* o      �<�< 0 sdk  + ,�;, o      �:�: 
0 config  �;  �?  $ k     --- ./. r     	010 I     �92�8�9 0 open_project  2 343 o    �7�7 0 xcodeapp xcodeApp4 5�65 o    �5�5 0 project_path  �6  �8  1 o      �4�4 0 proj  / 6�36 w   
 -787 O    -9:9 k    ,;; <=< r    >?> o    �2�2 0 sdk  ? 1    �1
�1 
asdk= @A@ r    BCB 4    �0D
�0 
buctD o    �/�/ 
0 config  C 1    �.
�. 
abctA E�-E r    ,FGF o     �,�, 0 sdk  G n      HIH 1   ) +�+
�+ 
valLI n     )JKJ 4   & )�*L
�* 
asbsL m   ' (MM �NN  S D K R O O TK n     &OPO 4   # &�)Q
�) 
bucfQ o   $ %�(�( 
0 config  P 1     #�'
�' 
atar�-  : o    �&�& 0 proj  8�                                                                                      @ alis    L  MacHD                      ʈ8H+   ��	Xcode.app                                                       ƶ�4�!        ����  	                Applications    ʈb7      �5"Q     �� ��  (MacHD:Developer: Applications: Xcode.app   	 X c o d e . a p p    M a c H D   Developer/Applications/Xcode.app  / ��  �3  " RSR l     �%�$�#�%  �$  �#  S TUT i   $ 'VWV I      �"X�!�" 0 	do_launch  X YZY o      � �  0 xcodeapp xcodeAppZ [\[ o      �� 0 project_path  \ ]^] o      �� 0 sdk  ^ _�_ o      �� 
0 config  �  �!  W k     i`` aba I     	�c�� 0 set_sdk_config  c ded o    �� 0 xcodeapp xcodeAppe fgf o    �� 0 project_path  g hih o    �� 0 sdk  i j�j o    �� 
0 config  �  �  b klk w   
 fmnm O    fopo Z    eqr�sq E    tut o    �� 0 sdk  u m    vv �ww  s i m u l a t o rr k    6xx yzy r    {|{ I   ���
� .pbpslnchnull���     obj �  �  | o      �� 0 ret  z }�} Z    6~��~ =   !��� o    �� 0 ret  � m     �� ��� ( E x e c u t a b l e   l a u n c h e d . O  $ 2��� I  , 1�
�	�
�
 .miscactvnull��� ��� null�	  �  � I   $ )���� 00 get_iphonesimulatorapp get_iPhoneSimulatorApp�  �  �  �  �  �  s k   9 e�� ��� r   9 <��� m   9 :�� ��� ( E x e c u t a b l e   l a u n c h e d .� o      �� 0 ret  � ��� l  = =����  �  �  � ��� l  = =� ���   � 8 2 to avoid "No provisioned iOS device is connected"   � ��� d   t o   a v o i d   " N o   p r o v i s i o n e d   i O S   d e v i c e   i s   c o n n e c t e d "� ��� I  = B������
�� .miscactvnull��� ��� null��  ��  � ��� I  C H������
�� .pbpscleenull���     obj ��  ��  � ��� I  I N������
�� .pbpsbuiinull���     obj ��  ��  � ��� l  O O��������  ��  ��  � ��� l  O O������  � @ : launch don't work to run in the device, so we do the next   � ��� t   l a u n c h   d o n ' t   w o r k   t o   r u n   i n   t h e   d e v i c e ,   s o   w e   d o   t h e   n e x t� ���� Q   O e����� t   R \��� r   T [��� I  T Y������
�� .pbpsdebgnull���     obj ��  ��  � o      ���� 0 ret  � m   R S���� � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��  p o    ���� 0 xcodeapp xcodeAppn�                                                                                      @ alis    L  MacHD                      ʈ8H+   ��	Xcode.app                                                       ƶ�4�!        ����  	                Applications    ʈb7      �5"Q     �� ��  (MacHD:Developer: Applications: Xcode.app   	 X c o d e . a p p    M a c H D   Developer/Applications/Xcode.app  / ��  l ��� l  g g��������  ��  ��  � ���� L   g i�� o   g h���� 0 ret  ��  U ��� l     ��������  ��  ��  � ��� i   ( +��� I      ������� 0 do_activate  � ���� o      ���� 0 app_name  ��  ��  � O    ��� I   ������
�� .miscactvnull��� ��� null��  ��  � 4     ���
�� 
capp� o    ���� 0 app_name  � ��� l     ��������  ��  ��  � ���� i   , /��� I      ������� 0 open_project  � ��� o      ���� 0 xcodeapp xcodeApp� ���� o      ���� 0 project_path  ��  ��  � k     ��� ��� O    ��� r    ��� I   �����
�� .coredoexbool       obj � 4    ���
�� 
file� o    ���� 0 project_path  ��  � o      ���� 0 project_exists  � m     ���                                                                                  sevs  alis    |  MacHD                      ʈ8H+     sSystem Events.app                                                ��� &        ����  	                CoreServices    ʈb7      � PB       s   f   e  6MacHD:System: Library: CoreServices: System Events.app  $  S y s t e m   E v e n t s . a p p    M a c H D  -System/Library/CoreServices/System Events.app   / ��  � ��� Z    ������� H    �� o    ���� 0 project_exists  � R    �����
�� .ascrerr ****      � ****� b    ��� m    �� ��� & P r o j e c t   n o t   f o u n d :  � o    ���� 0 project_path  ��  ��  ��  � ��� l     ��������  ��  ��  � ���� w     ���� O   " ���� k   & ��� ��� Q   & 7����� l  ) .���� I  ) .������
�� .aevtodocnull  �    alis��  ��  � 8 2 do this first else the open of a project timeouts   � ��� d   d o   t h i s   f i r s t   e l s e   t h e   o p e n   o f   a   p r o j e c t   t i m e o u t s� R      ������
�� .ascrerr ****      � ****��  ��  ��  � ��� I  8 =�����
�� .aevtodocnull  �    alis� o   8 9���� 0 project_path  ��  � ��� l  > >��������  ��  ��  � ��� l  > >������  � - ' resolve symbolic links in project path   � ��� N   r e s o l v e   s y m b o l i c   l i n k s   i n   p r o j e c t   p a t h� ��� r   > I��� I  > G�����
�� .sysoexecTEXT���     TEXT� b   > C��� b   > A��� m   > ?�� ���  c d  � o   ? @���� 0 project_path  � m   A B�� ���  ;   p w d   - P��  � o      ���� 0 resolved_project_path  � ��� l  J J��������  ��  ��  � ��� l  J J��� ��  � ; 5 we have to wait until the project is opened by xcode     � j   w e   h a v e   t o   w a i t   u n t i l   t h e   p r o j e c t   i s   o p e n e d   b y   x c o d e�  U   J � k   Q �  Q   Q �	
��	 X   T ��� Z   f ����� l  f {���� G   f { =  f m o   f g���� 0 project_path   n   g l 1   h l��
�� 
abph o   g h���� 0 proj   =  p w o   p q���� 0 resolved_project_path   n   q v 1   r v��
�� 
abph o   q r���� 0 proj  ��  ��   L   ~ � o   ~ ���� 0 proj  ��  ��  �� 0 proj   2  W Z��
�� 
proj
 R      ������
�� .ascrerr ****      � ****��  ��  ��   �� I  � �����
�� .sysodelanull��� ��� nmbr m   � � ?ə�������  ��   m   M N����  �� R   � �����
�� .ascrerr ****      � **** m   � �   �!! $ C a n ' t   o p e n   p r o j e c t��  ��  � o   " #���� 0 xcodeapp xcodeApp��                                                                                      @ alis    L  MacHD                      ʈ8H+   ��	Xcode.app                                                       ƶ�4�!        ����  	                Applications    ʈb7      �5"Q     �� ��  (MacHD:Developer: Applications: Xcode.app   	 X c o d e . a p p    M a c H D   Developer/Applications/Xcode.app  / ��  ��  ��       ��"   #$ �%&'()*+��  " ���������������������������� 20 pinvalidparameterserror pInvalidParametersError�� 40 pappversionnotfounderror pAppVersionNotFoundError�� *0 papprequiredversion pAppRequiredVersion
�� .aevtoappnull  �   � ****�� 0 check_parameters_count  �� "0 plsregisterpath pLSRegisterPath�� &0 getappwithversion getAppWithVersion�� 0 get_xcodeapp get_XCodeApp�� 00 get_iphonesimulatorapp get_iPhoneSimulatorApp�� 0 set_sdk_config  �� 0 	do_launch  �� 0 do_activate  �� 0 open_project  # ��  ���,-�~
�� .aevtoappnull  �   � ****�� 0 argv  �  , �}�} 0 argv  -  '�|�{ @�z�y�x R�w�v�u u�t ��| 0 testproj testProj
�{ .corecnte****       ****�z 0 get_xcodeapp get_XCodeApp�y 0 xcodeapp xcodeApp
�x 
cobj�w �v 0 check_parameters_count  �u 0 	do_launch  �t 0 do_activate  �~ y�E�O�j j  )jb   �%Y hO*j+ E�O��k/�   *��l+ 	O*Š�l/��m/���/�+ 
Y .��k/�  *�ll+ 	O*��l/k+ Y )jb   �%��k/%$ �s ��r�q./�p�s 0 check_parameters_count  �r �o0�o 0  �n�m�n 0 argv  �m 0 requiredcount requiredCount�q  . �l�k�l 0 argv  �k 0 requiredcount requiredCount/ �j ��i
�j .corecnte****       ****
�i 
cobj�p �j  � )jb   �%��k/%Y h% �h ��g�f12�e�h &0 getappwithversion getAppWithVersion�g �d3�d 3  �c�b�a�c 0 appbundleid appBundleID�b (0 apprequiredversion appRequiredVersion�a 20 appversionnotfounderror appVersionNotFoundError�f  1 �`�_�^�]�\�[�Z�` 0 appbundleid appBundleID�_ (0 apprequiredversion appRequiredVersion�^ 20 appversionnotfounderror appVersionNotFoundError�] 0 theapppaths theAppPaths�\ 0 theapp theApp�[ 0 
theapppath 
theAppPath�Z 0 	theappver 	theAppVer2  � ��Y�X�W�V�U�T�S�R�Q�P
�Y .sysoexecTEXT���     TEXT
�X 
cpar
�W 
msng
�V 
kocl
�U 
cobj
�T .corecnte****       ****
�S 
capp
�R 
vers�Q  �P  �e gb  �%�%�%j �-E�O�E�O ;�[��l kh   *�/�,E�O�� *�/E�OY hW X 
 h[OY��O��  	)j�Y hO�& �O�N�M45�L�O 0 get_xcodeapp get_XCodeApp�N  �M  4  5 �K�K &0 getappwithversion getAppWithVersion�L *�b  b  m+ ' �J�I�H67�G�J 00 get_iphonesimulatorapp get_iPhoneSimulatorApp�I  �H  6  7 �F�F &0 getappwithversion getAppWithVersion�G *�b  b  m+ ( �E$�D�C89�B�E 0 set_sdk_config  �D �A:�A :  �@�?�>�=�@ 0 xcodeapp xcodeApp�? 0 project_path  �> 0 sdk  �= 
0 config  �C  8 �<�;�:�9�8�< 0 xcodeapp xcodeApp�; 0 project_path  �: 0 sdk  �9 
0 config  �8 0 proj  9 
�78�6�5�4�3�2�1M�0�7 0 open_project  
�6 
asdk
�5 
buct
�4 
abct
�3 
atar
�2 
bucf
�1 
asbs
�0 
valL�B .*��l+  E�O�Z� �*�,FO*�/*�,FO�*�,�/��/�,FU) �/W�.�-;<�,�/ 0 	do_launch  �. �+=�+ =  �*�)�(�'�* 0 xcodeapp xcodeApp�) 0 project_path  �( 0 sdk  �' 
0 config  �-  ; �&�%�$�#�"�& 0 xcodeapp xcodeApp�% 0 project_path  �$ 0 sdk  �# 
0 config  �" 0 ret  < �!� nv�����������! �  0 set_sdk_config  
� .pbpslnchnull���     obj � 00 get_iphonesimulatorapp get_iPhoneSimulatorApp
� .miscactvnull��� ��� null
� .pbpscleenull���     obj 
� .pbpsbuiinull���     obj 
� .pbpsdebgnull���     obj �  �  �, j*�����+ O�Z� W�� %*j E�O��  *j+  *j UY hY .�E�O*j O*j 	O*j 
O kn*j E�oW X  hUO�* ����>?�� 0 do_activate  � �@� @  �� 0 app_name  �  > �� 0 app_name  ? ��
� 
capp
� .miscactvnull��� ��� null� *�/ *j U+ ����AB�� 0 open_project  � �
C�
 C  �	��	 0 xcodeapp xcodeApp� 0 project_path  �  A ������ 0 xcodeapp xcodeApp� 0 project_path  � 0 project_exists  � 0 resolved_project_path  � 0 proj  B ������ ������������������������ 
� 
file
� .coredoexbool       obj 
�  .aevtodocnull  �    alis��  ��  
�� .sysoexecTEXT���     TEXT�� 
�� 
proj
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
abph
�� 
bool
�� .sysodelanull��� ��� nmbr� �� *�/j E�UO� )j�%Y hO�Z� � 
*j W X  hO�j O�%�%j 
E�O T�kh : 4*�-[��l kh ��a , 
 ��a , a & �Y h[OY��W X  hOa j [OY��O)ja Uascr  ��ޭ