ArmurerieBuilder = {
    {
        JobName = 'police',
        JobLabel = "Police",
        SocietyName = "society_police",
        PointArme = vector3(106.6305, -1942.991, 20.80372),
        HelpTextArme = "Appuyer sur ~INPUT_CONTEXT~ pour ouvrir l'armurerie",
        PointAccessoire = vector3(107.9601, -1936.51, 20.80372),
        HelpTextAccessoire = "Appuyer sur ~INPUT_CONTEXT~ pour ouvrir le menu accessoire",
        ArmuriePaid = true,
        Gilet = true,
        Arme = {
           [1] = {category = "↓ ~g~Pistolet~s~ ↓"},
           [2] = {WeaponName = 'WEAPON_PISTOL', WeaponLabel = "Pistolet", price = 50, ammo = 50},
        },
        Accesoire = {
            {Label = "Flashlight", Item = 'flashlight', price = 50, Count = 0},
            {Label = "Grip", Item = 'grip', price = 50, Count = 0},
            {Label = "Weapon Skin", Item = 'yusuf', price = 50, Count = 0},
            {Label = "Suppressor", Item = 'suppressor', price = 50, Count = 0},
        }
    }
}