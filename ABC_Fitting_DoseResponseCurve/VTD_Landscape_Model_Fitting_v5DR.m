function [dydt,ChirTime]=VTD_Landscape_Model_Fitting_v5DR(t,y,p,dt,ChirTime)


%Chir integration with time.

%%Parameters

%p=(WNT, FGF,a0,b0,c0,u0,v0,a1,b1,c1,u1,v1,a2,b2,c2,u2,v2,a3,b3,c3,u3,v3,lambda,mu,e1,e2, alpha, gamma, psi, epsilon, d0, d1, d2, d3);

trans =[-1, 2];%translation of second decision to glue CE attractors
chi = tanh(10*(y(2,:)-(-0.5)));%Gluing function
y2=y+trans';%translated points

%Dose Response curve
p(1) = 0.5*(tanh(p(22)*(p(1)-p(23)))+1);

%Integration of ChirTime
ChirFactor =0.5*(tanh(10*(ChirTime-p(21)))+1);
ChirTime = max(ChirTime+(2*p(1)-1)*dt,0); %Update Chir Time
p(1)=min(ChirFactor+ p(1),1);


%transform morphogens into model parameters
mapped = zeros(6,1);
mapped(1:6) = p(3:8) + p(1)*p(9:14) + p(2)*p(15:20);%+ChirFactor*p(13:17)

dydt = - mapped(5)*0.5*(1+chi).*[mapped(1)+1*2*y(1,:)+3*y(1,:).^2+4*y(1,:).^3-4*y(2,:).^2; mapped(2) - 4 *2* y(1,:).* y(2,:) + 4* y(2,:).^3]...
    - mapped(6)*0.5*(1-chi).*[2*2*y2(2,:).*y2(1,:)+mapped(3)+4*y2(1,:).^3;   -3*y2(2,:).^2+2*y2(1,:).^2-2*y2(2,:)-mapped(4)+4*y2(2,:).^3];

end

%VTD_Landscape_Model_Fitting_v5DR.m (c) by Elena
%Camacho Aguilar and Meritxell Saez Cornellana

%VTD_Landscape_Model_Fitting_v5DR.m is licensed under a
%Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0) Unported License.

%You should have received a copy of the license along with this
%work.  If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.

