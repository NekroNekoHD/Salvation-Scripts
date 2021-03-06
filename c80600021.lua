--ゴーストリック・シュタイン
function c80600021.initial_effect(c)
	--sumlimit
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_CANNOT_SUMMON)
	e1:SetCondition(c80600021.sumcon)
	c:RegisterEffect(e1)
	--turn set
	local e2=Effect.CreateEffect(c)
	e2:SetCategory(CATEGORY_POSITION)
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetRange(LOCATION_MZONE)
	e2:SetTarget(c80600021.target)
	e2:SetOperation(c80600021.operation)
	c:RegisterEffect(e2)
	--tohand
	local e4=Effect.CreateEffect(c)
	e4:SetCategory(CATEGORY_TOHAND+CATEGORY_SEARCH)
	e4:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e4:SetCode(EVENT_BATTLE_DAMAGE)
	e4:SetCondition(c80600021.condition)
	e4:SetTarget(c80600021.target2)
	e4:SetOperation(c80600021.operation2)
	c:RegisterEffect(e4)
end
function c80600021.sumfilter(c)
	return c:IsFaceup() and c:IsSetCard(0x91)
end
function c80600021.sumcon(e)
	return not Duel.IsExistingMatchingCard(c80600021.sumfilter,e:GetHandlerPlayer(),LOCATION_MZONE,0,1,nil)
end
function c80600021.target(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	if chk==0 then return c:IsCanTurnSet() and c:GetFlagEffect(80600021)==0 end
	c:RegisterFlagEffect(80600021,RESET_EVENT+0x1fc0000+RESET_PHASE+PHASE_END,0,1)
	Duel.SetOperationInfo(0,CATEGORY_POSITION,c,1,0,0)
end
function c80600021.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsRelateToEffect(e) and c:IsFaceup() then
		Duel.ChangePosition(c,POS_FACEDOWN_DEFENCE)
	end
end
function c80600021.condition(e,tp,eg,ep,ev,re,r,rp)
	return ep~=tp
end
function c80600021.filter(c)
	return c:IsSetCard(0x91) and c:IsType(TYPE_SPELL+TYPE_TRAP) and c:IsAbleToHand()
end
function c80600021.target2(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chk==0 then return Duel.GetFlagEffect(tp,80600021)==0 and Duel.IsExistingMatchingCard(c80600021.filter,tp,LOCATION_DECK,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
	Duel.RegisterFlagEffect(tp,80600021,RESET_PHASE+PHASE_END,0,1)
end
function c80600021.operation2(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,c80600021.filter,tp,LOCATION_DECK,0,1,1,nil)
	if g:GetCount()>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	end
end