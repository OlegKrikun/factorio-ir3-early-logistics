local function removeTechIngredients(tech)
    for i, item in pairs(tech.unit.ingredients) do
        if item[1] == 'utility-science-pack' then
            table.remove(tech.unit.ingredients, i)
        end
    end
    for i, item in pairs(tech.unit.ingredients) do
        if item[1] == 'production-science-pack' then
            table.remove(tech.unit.ingredients, i)
        end
    end
end

local function replaceRecipeIngredients(recipe)
    if recipe then
        for i, item in pairs(recipe.ingredients) do
            if item[1] == 'processing-unit' then
                recipe.ingredients[i][1] = 'advanced-circuit'
            end
            if item[1] == 'computer-mk3' then
                recipe.ingredients[i][1] = 'computer-mk2'
            end
        end
    end
end

local function updateLogisticSystem()
    local tech = data.raw.technology['logistic-system']
    if not tech then
        print('logistic-system does not exist')
        return
    end

    if tech.prerequisites then
        for i, prereq in pairs(tech.prerequisites) do
            if prereq == 'ir-electronics-3' then
                tech.prerequisites[i] = 'ir-electronics-2'
            end
        end
    end

    if tech then 
        removeTechIngredients(tech)
    end

    replaceRecipeIngredients(data.raw.recipe['logistic-chest-buffer'])
    replaceRecipeIngredients(data.raw.recipe['logistic-chest-requester'])
end

local function updateContainers()
    local tech = data.raw.technology['aai-strongbox-logistic']
    if tech then 
        removeTechIngredients(tech)
    end
    local tech = data.raw.technology['aai-storehouse-logistic']
    if tech then 
        removeTechIngredients(tech)
    end
    local tech = data.raw.technology['aai-warehouse-logistic']
    if tech then 
        removeTechIngredients(tech)
    end
    replaceRecipeIngredients(data.raw.recipe['aai-strongbox-buffer'])
    replaceRecipeIngredients(data.raw.recipe['aai-strongbox-requester'])
    replaceRecipeIngredients(data.raw.recipe['aai-storehouse-buffer'])
    replaceRecipeIngredients(data.raw.recipe['aai-storehouse-requester'])
    replaceRecipeIngredients(data.raw.recipe['aai-warehouse-buffer'])
    replaceRecipeIngredients(data.raw.recipe['aai-warehouse-requester'])
end

updateLogisticSystem()
updateContainers()
