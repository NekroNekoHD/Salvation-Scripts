--マジシャンズ・ヴァルキリア
function c80304126.initial_effect(c)
	--cannot be battle target
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetRange(LOCATION_MZONE)
	e1:SetTargetRange(LOCATION_MZONE,0)
	e1:SetProperty(EFFECT_FLAG_IGNORE_IMMUNE)
	e1:SetCode(EFFECT_CANNOT_BE_BATTLE_TARGET)
	e1:SetTarget(c80304126.tg)
	e1:SetValue(aux.imval1)
	c:RegisterEffect(e1)
end
function c80304126.tg(e,c)
	return c~=e:GetHandler() and c:IsRace(RACE_SPELLCASTER)
end
