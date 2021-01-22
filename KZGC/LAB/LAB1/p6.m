num = conv([16],[1,43]);
den = conv([1,11],conv([1,12],[1,15]))
sys = tf(num,den)