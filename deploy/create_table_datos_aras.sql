-- Deploy utentes:create_table_datos_aras to pg

-- ARAN, ARAS, ARAZ, DPMAIP

-- endereco => ENDERECO
-- outros => VISAO & MISSAO
-- conta_bancaria => ENTIDADE, N CONTA, IBAN
BEGIN;
CREATE TABLE utentes.datos_aras (
    "id" text PRIMARY KEY,
    "name" text NOT NULL,
    "nuit" text NOT NULL,
    "endereco" text,
    "conta_bancaria" JSONB,
    "outros" JSONB,
    "valores" JSONB,
    "sede" JSONB,
    "unidades" JSONB
);
-- ARA SUL
INSERT INTO utentes.datos_aras (
    id,
    name,
    nuit,
    endereco,
    conta_bancaria,
    outros,
    valores,
    sede,
    unidades
) VALUES(
    'ARAS',
    'Administração Regional de Águas do Sul',
    '500001062',
    'Av. Samora Machel nº 30 7º andar. 4033, 1º Bairro Fiscal, Cidade de Maputo, Moçambique',
    '{"entidade":"STANDARD BANK", "n_conta":"1010149101003", "iban":"MZ59 0003 0101 0014910100396"}',
    '{"visao": "Assegurar a gestão dos recursos hídricos por forma a garantir água em quantidade e qualidade para a preservação do mio ambiente, a mitigação dos efeitos das cheias e secas cíclicas e satisfação das necessidades futuras","missao": "Promover a utilização racional dos recursos hídricos para a defensa do meio ambiente e satisfazer as necessidades dos utentes, alargando a rede de monitoramento, aumentando a capacidade de armazenamento e planeando os recursos hídricos disponíveis com base nas bacias hidrográficas"}',
    '["Orientação para o utente", "Gestão integrada e participativa", "Competência e integridade", "Responsabilidade social"]',
    '{
        "nome": "ARA SUL",
        "datos": {
            "Localidade": "Cidade de Maputo",
            "Provincia": "Maputo",
            "Telefone": "(+258 21) 30 67 29/30",
            "Fax": "(+258 21) 30 67 56",
            "Email": "arasul@ara-sul.co.mz",
            "Website": "www.ara-sul.co.mz"
        }
    }',
    '[
        {"nome": "UGBS - UNIDADE DE GESTÃO DA BACIA DO SAVE",
        "datos": {
            "Localidade": "Maxixe",
            "Provincia": "Inhambane",
            "Telefone": "(+258 29) 33 08 53",
            "Fax": "(+258 29) 33 03 85"
            }
        },
        {"nome": "UGBL - UNIDADE DE GESTÃO DA BACIA DO LIMPOPO",
        "datos": {
            "Localidade": "Lionde",
            "Provincia": "Gaza",
            "Telefone": "(+258 28) 12 00 58",
            "Fax": "(+258 21) 71 30 22"
            }
        },
        {"nome": "UGBI - UNIDADE DE GESTÃO DA BACIA DO INCOMATI",
        "datos": {
            "Localidade": "Corumana",
            "Provincia": "Maputo",
            "Telefone": "(+258 21) 56 00 16",
            "Fax": "(+258 21) 56 00 22"
            }
        },
        {"nome": "UGBU - UNIDADE DE GESTÃO DA BACIA DO UMBELÚZE",
        "datos": {
            "Localidade": "Boane",
            "Provincia": "Maputo",
            "Telefone": "(+258 21) 75 92 72",
            "Fax": "(+258 21) 75 92 72"
            }
        }
    ]');
-- ARA NORTE
INSERT INTO utentes.datos_aras (
    id,
    name,
    nuit,
    endereco,
    conta_bancaria,
    outros,
    valores,
    sede,
    unidades
) VALUES(
    'ARAN',
    'Administração Regional de Águas do Norte',
    '500021357',
    'Rúa, nº: Avda. Josina Machel nº 583, Bairro de Natite, Cidade de Pemba, Moçambique',
    '{"entidade":"BCI", "n_conta":"1428286310001", "iban":"MZ59 0008 0000 1428286310180"}',
    '{"visao": "Promover o desenvolvimento e gestão coordenada dos recursos hídricos, envolvendo diversos actores a nível da sua área de jurisdição, de forma a garantir a segurança, bem-estar social e económico, sem comprometer a sustentabilidade dos ecossistemas","missao": "Implementar e coordenar a gestão integrada e participativa dos recursos hídricos, regular o acesso a água, por forma a garantir a preservação ambiental e um desenvolvimento sustentável e equilibrado, hoje, amanhã e sempre"}',
    '[]',
    '{
        "nome": "ARA NORTE",
        "datos": {
            "Localidade": "Cidade de Pemba",
            "Provincia": "Cabo Delgado",
            "Telefone": "(+258 27) 22 03 19",
            "Fax": "(+258 27) 22 14 01",
            "Email": "info.aranorte@gmail.com",
            "Website": "www.ara-norte.co.mz"
            }
    }',
    '[
        {"nome": "UGBS - UNIDADE DE GESTÃO DA BACIA DE MESSALO E MONTEPUEZ",
        "datos": {
            "Localidade": "Montepuez",
            "Provincia": "Cabo Delgado",
            "Telefone": "",
            "Email": ""
            }
        },
        {"nome": "UGBL - UNIDADE DE GESTÃO DA BACIA DO ROVUMA",
        "datos": {
            "Localidade": "Lichinga",
            "Provincia": "Niassa",
            "Telefone": "",
            "Email": ""
            }
        },
        {"nome": "UGBI - UNIDADE DE GESTÃO DAS BACIAS COSTEIRAS",
        "datos": {
            "Localidade": "Moçimboa da Praia",
            "Provincia": "Cabo Delgado",
            "Telefone": "",
            "Email": ""
            }
        }
    ]');
-- ARA ZAMBEZE
INSERT INTO utentes.datos_aras (
    id,
    name,
    nuit,
    endereco,
    conta_bancaria,
    outros,
    valores,
    sede,
    unidades
) VALUES(
    'ARAZ',
    'Administração Regional de Águas do Zambeze',
    '',
    'Bairro Mpadue EN, nº 07, C.P. 67, Cidade de Tete, Moçambique',
    '{"entidade":"", "n_conta":"", "iban":""}',
    '{"visao": "","missao": "Garantir a gestão participativa, integrada e sustentável dos recursos hídricos da bacia hidrográfica do rio Zambeze, através do estabelecimento e manutenção de uma base de dados hidrológicos, de um sistema de comunicação com os utentes eficaz e eficiente e do controle e fiscalização da utilização dos recursos hídricos da bacia"}',
    '[]',
    '{
        "nome": "ARA ZAMBEZE",
        "datos": {
            "Localidade": "Cidade de Tête",
            "Provincia": "Tête",
            "Telefone": "(+258 25) 22 39 07/09",
            "Fax": "(+258 25) 22 39 08",
            "Email": "arazambeze@teledata.mz",
            "Website": "http://www.arazambeze.gov.mz"
            }
    }',
    '[]');


COMMIT;
