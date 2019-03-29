// Initial wiring: [11, 5, 3, 8, 4, 10, 19, 12, 9, 18, 14, 15, 16, 7, 6, 1, 17, 13, 0, 2]
// Resulting wiring: [11, 5, 3, 8, 4, 10, 19, 12, 9, 18, 14, 15, 16, 7, 6, 1, 17, 13, 0, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[8], q[1];
cx q[15], q[13];
cx q[18], q[12];
cx q[13], q[14];
cx q[12], q[17];
cx q[17], q[16];
cx q[11], q[12];
cx q[0], q[1];
