// Initial wiring: [14, 10, 18, 19, 2, 8, 17, 4, 5, 9, 3, 11, 6, 13, 12, 15, 16, 0, 7, 1]
// Resulting wiring: [14, 10, 18, 19, 2, 8, 17, 4, 5, 9, 3, 11, 6, 13, 12, 15, 16, 0, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[8];
cx q[11], q[8];
cx q[17], q[16];
cx q[16], q[13];
cx q[13], q[6];
cx q[19], q[18];
cx q[18], q[12];
cx q[15], q[16];
