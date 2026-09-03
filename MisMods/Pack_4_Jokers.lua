--- STEAMODDED HEADER
--- MOD_NAME: Mod Jokers
--- MOD_ID: MisJokers
--- MOD_AUTHOR: [Gus]
--- MOD_DESCRIPTION: Pack de 4 Jokers personalizados

--Joker 1
SMODS.Atlas({
    key = "joker_1_atlas",
    path = "Linux.png",
    px = 71,
    py = 95
})

SMODS.Joker({
    key = "joker_1",
    loc_txt = {
        name = "Tux Malvado",
        text = {
            "Penaliza {C:red}-#1# de Mult{}."
        }
    },
    -- Configuracion de texto
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    config = { extra = { mult = 10 } },
    rarity = 1, 
    cost = 4,
    atlas = "joker_1_atlas",
    pos = { x = 0, y = 0 },
    calculate = function(self, card, context)
        if context.joker_main then
            return { mult = -card.ability.extra.mult }
        end
    end
})

--Joker 2
SMODS.Atlas({
    key = "joker_2_atlas",
    path = "genio.png",
    px = 71,
    py = 95
})

SMODS.Joker({
    key = "joker_2",
    loc_txt = {
        name = "Genio!!!",
        text = {
            "Si la barra de Jokers",
            "esta llena, otorga",
            "{C:chips}+#1#{} fichas y {C:mult}x#2#{} Mult."
        }
    },
    --Configuracion de texto
    loc_vars = function(self, info_queue, card)
        return { vars = { (card.ability.extra and card.ability.extra.chips) or 600, (card.ability.extra and card.ability.extra.xmult) or 700 } }
    end,
    config = { extra = { chips = 600, xmult = 700 } },
    rarity = 4,
    cost = 15,
    atlas = "joker_2_atlas",
    pos = { x = 0, y = 0 },
    calculate = function(self, card, context)
        --Condicion para comprobar la barra de jokers
        if context.joker_main then
            local joker_count = #G.jokers.cards
            local joker_limit = G.jokers.config.card_limit
            if joker_count >= joker_limit then
                return { chips = card.ability.extra.chips, xmult = card.ability.extra.xmult }
            end
        end
    end
})

--Joker 3
SMODS.Atlas({
    key = "joker_3_atlas",
    path = "juan.png",
    px = 71,
    py = 95
})


SMODS.Joker({
    key = "joker_3",
    loc_txt = {
        name = "Juan",
        text = {
            "Si tienes a {C:red}Tux Malvado{}",
            "otorga {C:mult}+#1#{} Mult",
            "por carta en tu baraja."
        }
    },
    --Configuracion de texto
    loc_vars = function(self, info_queue, card)
        return { vars = { 3 } }
    end,
    config = {},
    rarity = 3,
    cost = 4,
    atlas = "joker_3_atlas",
    pos = { x = 0, y = 0 },
    calculate = function(self, card, context)
        --Condicion definida que si tenes al joker 1 (tux malvado) equipado se acciona
        if context.joker_main then
            local tiene_tux = false
            for _, j in ipairs(G.jokers.cards) do
                if j.config.center.key == "joker_1" then
                    tiene_tux = true
                    break
                end
            end
            if tiene_tux then
                local cartas = #G.playing_cards
                return { mult = cartas * 3 }
            end
        end
    end
})
--Joker 4
SMODS.Atlas({
    key = "joker_4_atlas",
    path = "Joker_Windows.png",
    px = 71,
    py = 95,
})


SMODS.Joker({
    key = "joker_4",
    loc_txt = {
        name = "Win_Joker",
        text = {
            "Otorga {C:mult}+#1#{} Mult",
            "por cada Joker del",
            "pack equipado."
        }
    },
    loc_vars = function(self, info_queue, card)
        local count = 0
        if G.jokers then
            for _, j in ipairs(G.jokers.cards) do
                local k = j.config.center.key
                if k == "joker_1" or k == "joker_2" or k == "joker_3" then
                    count = count + 1
                end
            end
        end
        return { vars = { count * 10 } }
    end,
    config = {},
    rarity = 2,
    cost = 6,
    atlas = "joker_4_atlas",
    pos = { x = 0, y = 0 },
    calculate = function(self, card, context)
        if context.joker_main then
            local count = 0
            for _, j in ipairs(G.jokers.cards) do
                local k = j.config.center.key
                if k == "joker_1" or k == "joker_2" or k == "joker_3" then
                    count = count + 1
                end
            end
            return { mult = count * 10 }
        end
    end
})