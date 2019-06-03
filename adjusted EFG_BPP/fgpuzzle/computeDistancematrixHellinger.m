function KLDists_sym = computeDistancematrixHellinger(gaussSets,areaThres)   

numPOI=length(gaussSets);
KLDivergence=zeros(numPOI,numPOI); 

for k=1:numPOI
    if gaussSets(k).size<areaThres
        KLDivergence(1:numPOI,k)=NaN;
        continue;
    end      
    
    mu_k=gaussSets(k).mean;
    sigma_k=gaussSets(k).cov;

    for i=1:numPOI
        if (i==k)
            continue;
        end
        if gaussSets(i).size<areaThres
            KLDivergence(i,k)=NaN;
            continue;
        end
        mu_i=gaussSets(i).mean;                 
        sigma_i=gaussSets(i).cov; 
        
        Hterm1 = sqrt(2 * det(sigma_k) * det(sigma_i));
        Hterm1 = Hterm1 / sqrt(det(sigma_k) + det(sigma_i));
        covInv = pinv(sigma_k + sigma_i);
        Hterm2 = (mu_i-mu_k) * covInv * (mu_i-mu_k).';
        Hterm2 = 1 / exp(0.25 * Hterm2);
        KLDivergence(i,k) = 1 - Hterm1 * Hterm2;    
    end
end

KLDists_sym=zeros(numPOI,numPOI);

for i=1:numPOI
    for j=1:numPOI
        KLDists_sym(i,j)=min(KLDivergence(i,j),KLDivergence(j,i));   %note that min(3,NaN)=3
    end
end
