
[auRecord, fs1] = audioread('Record.wav');
[auJazz, fs2] = audioread('jazz.wav');

if fs1 ~= fs2
    auJazzTemp = resample(auJazz, fs1, fs2);
else
    auJazzTemp = x2; 
end

volRecord = 0.1;
auJazzMain = auJazzTemp * volRecord;

startMix = 1; 
endMix = min(length(auRecord), length(auJazzMain)); 

resultMix = auRecord;
resultMix(startMix:endMix) = resultMix(startMix:endMix) + auJazzMain(startMix:endMix);

resultMix = resultMix / max(abs(resultMix));

audiowrite('MergeAudio.wav', resultMix, fs1);
