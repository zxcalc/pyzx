// Initial wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
// Resulting wiring: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[10], q[8];
cx q[11], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[8], q[7];
cx q[11], q[8];
cx q[12], q[11];
cx q[11], q[8];
cx q[12], q[6];
cx q[17], q[11];
cx q[17], q[12];
cx q[11], q[8];
cx q[11], q[12];
cx q[12], q[11];
cx q[8], q[11];
cx q[11], q[12];
cx q[6], q[12];
cx q[4], q[6];
cx q[6], q[12];
cx q[12], q[11];
cx q[12], q[6];
cx q[11], q[12];
