@echo offREM Buscando unidade de Drivers clssetlocalfor %%1 in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do (    if exist %%1:\ (    fsutil fsinfo drivetype %%1:     )  ) pause