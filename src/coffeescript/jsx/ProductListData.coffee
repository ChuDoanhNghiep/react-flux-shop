module.exports =
  init: ->
    localStorage.clear()
    localStorage.setItem "products", JSON.stringify [
        id: "00000001"
        sku: "123123"
        name: "Château Gruaud-Larose Larose de Gruaud Saint Julien 2006 0.75L"
        image: "http://placehold.it/200"
        category: "wine"
        brand: "DFS Selects: Wine"
        currency: "S$"
        price: 100.00
        size: 0.75
        country: "france"
        grape_varietal: "Merlot"
        region: "Bordeaux"
        shop_recommended: "true"
        inventory: 11
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000002"
        sku: "235354"
        name: "Babich Irongate Cabernet Merlot Franc 0.75L"
        image: "http://placehold.it/200"
        category: "wine"
        brand: "Babich Wines Ltd"
        price: 200
        size: 0.75
        country: "Argentina"
        grape_varietal: "Sangiovese"
        region: "Burgundy"
        shop_recommended: "true"
        currency: "S$"
        inventory: 12
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000003"
        name: "Mud House Marlborough Pinot Gris 2013 0.75L"
        image: "http://placehold.it/200"
        category: "wine"
        brand: "Mud HOurs"
        price: 128.00
        size: 0.75
        country: "spain"
        grape_varietal: "Cabearnet Sauvignon"
        region: "Central Otago"
        shop_recommended: "true"
        currency: "S$"
        inventory: 12
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000004"
        name: "Zinfandelic 2012 Sierra Foothills Old Vine Zinfandel 0.75L"
        image: "http://placehold.it/200"
        category: "wine"
        brand: "Zinfandelic"
        price: 100.00
        size: 0.75
        country: "south africa"
        grape_varietal: "Shiraz"
        region: "Champagne"
        shop_recommended: "true"
        currency: "S$"
        inventory: 12
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,     
        id: "00000005"
        name: "Bottega Il Vino dell’Amore Petalo Moscato 0.2L"
        image: "http://placehold.it/200"
        category: "wine"
        brand: "Bottega"
        price: 163.00
        size: 0.75
        country: "Germany"
        grape_varietal: "riesling"
        region: "graves"
        shop_recommended: "true"
        currency: "S$"
        inventory: 12
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000006"
        name: "Wine Spots 2011 Napa Valley Cabernet Sauvignon 0.75L"
        image: "http://placehold.it/200"
        category: "wine"
        brand: "Wine Spots"
        price: 110.00
        size: 0.75
        country: "chile"
        grape_varietal: "pinot noir"
        region: "Bordeaux"
        shop_recommended: "true"
        currency: "S$"
        inventory: 12
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000007"
        name: "Frescobaldi Mormoreto 2010 0.75L"
        image: "http://placehold.it/200"
        category: "wine"
        brand: "Frescobaldi"
        price: 134.00
        size: 0.75
        country: "france"
        grape_varietal: "Merlot"
        region: "South Australia"
        shop_recommended: "true"
        currency: "S$"
        inventory: 12
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000008"
        name: "Tommasi Monte Croce Passito Bianco IGT 2010 0.375L"
        image: "http://placehold.it/200"
        category: "wine"
        brand: "Tommasi"
        price: 70.00
        size: 0.75
        country: "france"
        grape_varietal: "Merlot"
        region: "St. Julien"
        shop_recommended: "true"
        currency: "S$"
        inventory: 12
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000009"
        name: "Yalumba Y Series South Australia Sangiovese Rose 0.75L"
        image: "http://placehold.it/200"
        category: "wine"
        brand: "Yalumba"
        price: 29.00
        size: 0.75
        country: "canada"
        grape_varietal: "Merlot"
        region: "Rhone Valley"
        shop_recommended: "true"
        currency: "S$"
        inventory: 12
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000010"
        name: "Silver Oak Napa Valley Cabernet Sauvignon 0.75L"
        image: "http://placehold.it/200"
        category: "wine"
        brand: "Silver Oak Cellars"
        price: 49.00
        size: 0.75
        country: "united states"
        grape_varietal: "Sauvignon Blanc"
        region: "Pessac Leognan"
        shop_recommended: "true"
        currency: "S$"
        inventory: 12
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000011"
        name: "Frescobaldi Nipozzano Riserva 0.75L"
        image: "http://placehold.it/200"
        category: "wine"
        brand: "Frescobaldi"
        price: 400.00
        size: 0.75
        country: "england"
        grape_varietal: "Bordeaux Red Blend"
        region: "Tuscany"
        shop_recommended: "true"
        currency: "S$"
        inventory: 12 
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000012"
        sku: "1938374638"
        name: "Moet & Chandon Grand Vintage 2003"
        image: "http://placehold.it/200"
        category: "wine"
        brand: "Moet & Chandon"
        price: 123.45
        size: 0.75
        country: "united states"
        grape_varietal: "Sauvignon Blanc"
        region: "Pessac Leognan"
        shop_recommended: "true"
        currency: "S$"
        inventory: 2
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000013"
        sku: "1938373445"
        name: "Kronenbourg 1664 0.33L X 3"
        image: "http://placehold.it/200"
        category: "beer"
        brand: "Shop selects: Beer"
        price: 173.45
        size: 1
        shop_recommended: "true"
        currency: "S$"
        inventory: 2
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000014"
        sku: "193232374638"
        name: "Somersby Cider 0.33L x3"
        image: "http://placehold.it/200"
        category: "beer"
        brand: "DFS Selects: Beer"
        price: 153.45
        size: 1
        shop_recommended: "true"
        currency: "S$"
        inventory: 2
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000015"
        sku: "19334424638"
        name: "Hoegaarden 0.33L X 3"
        image: "http://placehold.it/200"
        category: "beer"
        brand: "DFS selects: Beer"
        price: 223.45
        size: 1
        shop_recommended: "true"
        currency: "S$"
        inventory: 2
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000016"
        sku: "1923244638"
        name: "Johnni Walker GOld reserve 1L"
        image: "http://placehold.it/200"
        category: "spirit"
        brand: "johnnie walker"
        price: 133.45
        type: "Scotch Whisky"
        size: 1
        shop_recommended: "true"
        currency: "S$"
        inventory: 2
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000017"
        sku: "194242424638"
        name: "Zacapa 23 year old 1L"
        image: "http://placehold.it/200"
        category: "spirit"
        brand: "Zacapa"
        price: 123.45
        type: "Liqueur"
        size: 1
        shop_recommended: "true"
        currency: "S$"
        inventory: 2
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000017"
        sku: "192323234638"
        name: "Shui jing fang red fortune 0.5L"
        image: "http://placehold.it/200"
        category: "spirit"
        brand: "shui jing fang"
        price: 623.45
        type: "Baijiu"
        size: 0.5
        shop_recommended: "true"
        currency: "S$"
        inventory: 2
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000018"
        sku: "232423244638"
        name: "Chatelle napoleon 1L"
        image: "http://placehold.it/200"
        category: "spirit"
        brand: "chatelle napoleon brandy"
        price: 23.45
        type: "brandy"
        size: 1
        shop_recommended: "true"
        currency: "S$"
        inventory: 2
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000019"
        sku: "42424223244638"
        name: "Martell XO 1L"
        image: "http://placehold.it/200"
        category: "spirit"
        brand: "martell"
        price: 422.45
        type: "Cognac"
        size: 1
        shop_recommended: "true"
        currency: "S$"
        inventory: 2
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000020"
        sku: "1923244638"
        name: "Tanqueray Ten 1L"
        image: "http://placehold.it/200"
        category: "spirit"
        brand: "tanqueray"
        price: 223.45
        type: "gin"
        size: 1
        shop_recommended: "true"
        currency: "S$"
        inventory: 2
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
      ,
        id: "00000021"
        sku: "8923244638"
        name: "Absolut Vodka 1L"
        image: "http://placehold.it/200"
        category: "spirit"
        brand: "absolut"
        price: 23.45
        type: "vodka"
        size: 1
        shop_recommended: "true"
        currency: "S$"
        inventory: 2
        description: "Integer quis magna purus. Duis ut velit magna. In hac habitasse platea dictumst. Nullam ac blandit nisl. Cras eget mi erat. Nunc congue dolor felis, nec cursus elit rutrum eu."
     
    ]