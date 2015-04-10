--キャット・ワールド CAT WORLD
function c175.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	c:RegisterEffect(e1)
	--ad up
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_UPDATE_ATTACK)
	e2:SetRange(LOCATION_SZONE)
	e2:SetTargetRange(LOCATION_MZONE,LOCATION_MZONE)
	e2:SetValue(c175.val)
	c:RegisterEffect(e2)
end
function c175.val(e,c)
	if c:IsFaceup() and c:IsSetCard(0x95) then return c:GetBaseAttack()
	else
	return 0
	end 
end