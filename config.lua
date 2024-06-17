Config = {}


--[[Config.TitleServer  (Title Spawn Selector)]]
--[[Config.IconTitleServer (Icon Title Spawn Selector)]]

Config.TitleServer = 'LEGACY SPAWN'
Config.IconTitleServer = 'fas fa-building'

--[[Position (Position First Cam Open Ui)]]
--[[Height (Height of the camera)]]
--[[rot (Rotation of the camera]]

Config.FirstCam = {
    Position = vector3(120.1660, -1730.9347, 30.1114),
    Height = 400.0,
    rot = vector3(90.0, 0.0, 0.0),
}

--[[EnableLog (Enable Or Disable Log)]]
--[[WebhookURL (Webhook Discord to send Embed)]]
--[[LogoURL (Logo url for Embed)]]
--[[SinglePhoto (webhook to send screen only)]]

Config.Webhook = {
    EnableLog   = true,
    WebhookURL  ='',
    LogoURL     ='https://media.discordapp.net/attachments/1190803703775625266/1217842387070746735/esxLogo.png?ex=6670f15b&is=666f9fdb&hm=937b28f700db57b52cf157637c6eb1a8d2233861296145ff62cdf5fa619bef84&=&format=webp&quality=lossless&width=663&height=663',
    SinglePhoto = ''
}

Config.SpawnData = {
    {
        key = "Philbox Hill",
        SpawnPoint = vector4(150.9530, -565.6229, 43.8913, 155.4376),
        NamePoint = 'Philbox Hill',
        Description =  'This area overlooks the vibrant cityscape of Los Santos. With its serene environment and picturesque views, Philbox Hill is the perfect spot for those seeking tranquility amidst the bustling city life.',
        Icon = 'fas fa-mountain',
        IconColor = '#38D9A9',
        Image = 'https://cdn.discordapp.com/attachments/1236322918431068170/1252019837895577812/image.png?ex=6670b1d6&is=666f6056&hm=9ef2234e422e2a328f2640c8f074b7822a7b63480e5ed162fccd73393a979a96&',
        CamData = {
            Height = 2500.0,
            rot = vector3(90.0, 0.0, 0.0),
        }
    },
    {
        key = "Winewood Hill",
        SpawnPoint = vector4(-179.7400, 473.6636, 133.7753, 247.7795),
        NamePoint = 'Winewood Hill',
        Description = 'Nestled in the heart of Winewood, this hilltop offers breathtaking vistas of the city below. Surrounded by lush greenery and majestic architecture, Winewood Hill embodies luxury and sophistication, making it a coveted location for discerning individuals.',
        Icon = 'fas fa-city',
        IconColor = '#38D9A9',
        Image = 'https://cdn.discordapp.com/attachments/1236322918431068170/1252018950871449650/image.png?ex=6670b103&is=666f5f83&hm=20261525bb1374af5b0017dd54baf6d8938aa4b232db350457bfb638d14db61d&',
        CamData = {
            Height = 2500.0,
            rot = vector3(90.0, 0.0, 0.0),
        }
    },
    {
        key = "Philbox Hill Central",
        SpawnPoint = vector4(-56.9369, -870.5160, 40.5839, 279.5356),
        NamePoint = 'Philbox Hill Central',
        Description = 'Located in the heart of Philbox Hill, this central spot offers panoramic views of the cityscape and its surroundings. With its bustling atmosphere and convenient location, Philbox Hill Central is ideal for those looking to experience the pulse of Los Santos.',
        Icon = 'fas fa-building',
        IconColor = '#38D9A9',
        Image =  'https://cdn.discordapp.com/attachments/1217899422604595300/1252047868093796382/image.png?ex=6670cbf1&is=666f7a71&hm=b0075162811e2e025b51b61e5a0be5c6e984347be57471aaaf2e13e3880911e7&',
        CamData = {
            Height = 2500.0,
            rot = vector3(90.0, 0.0, 0.0),
        }
    },
    {
        key = "Paleto Bay (Blane Bank)",
        SpawnPoint = vector4(-121.7401, 6458.7607, 31.3935, 158.0600),
        NamePoint = 'Paleto Bay (Blane Bank)"',
        Description = 'A quaint coastal town offering a relaxed atmosphere with scenic ocean views. Paleto Bay is perfect for those who appreciate a slower pace of life.',
        Icon = 'fas fa-tree',
        IconColor = '#38D9A9',
        Image ='https://cdn.discordapp.com/attachments/1184234727490719846/1252318535951056926/image.png?ex=6671c805&is=66707685&hm=06174f0f00e5aff26d222cb1d16b77e66205e61904ba8d87dd1604be367b7758&',
        CamData = {
            Height = 2500.0,
            rot = vector3(90.0, 0.0, 0.0),
        }
    },
    {
        key = "Sandy Shores (Hospital)",
        SpawnPoint = vector4(1855.6682, 3681.6245, 34.2675, 218.9876),
        NamePoint = 'Sandy Shores (Hospital)',
        Description = 'An arid desert town known for its rugged landscape and adventurous spirit. Sandy Shores offers a unique living experience away from the city.',
        Icon = 'fas fa-road',
        IconColor = '#38D9A9',
        Image = 'https://cdn.discordapp.com/attachments/1184234727490719846/1252318821952524411/image.png?ex=6671c84a&is=667076ca&hm=8505ac47ee49c517a00a4e542148ac1f6bb9a464dee2f4dab7fef0e57197b930&',
        CamData = {
            Height = 2500.0,
            rot = vector3(90.0, 0.0, 0.0),
        }
    },
    {
        key = "Los Santos International Airport",
        SpawnPoint = vector4(-1017.9005, -2697.7239, 13.9431, 149.7823),
        NamePoint = 'Los Santos International Airport',
        Description ='Located near the bustling LSIA, this area provides quick access to air travel and offers a dynamic urban lifestyle.',
        Icon = 'fas fa-plane',
        IconColor = '#38D9A9',
        Image ='https://cdn.discordapp.com/attachments/1184234727490719846/1252319115784224871/image.png?ex=6671c890&is=66707710&hm=3c0764310555ffc090b1ccb9577807a9fefa4e62b7680a9d63a14955101ed240&',
        CamData = {
            Height = 2500.0,
            rot = vector3(90.0, 0.0, 0.0),
        }
    }
}
