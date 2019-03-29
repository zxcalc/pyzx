// Initial wiring: [2, 8, 15, 6, 16, 12, 4, 3, 11, 10, 18, 5, 13, 9, 17, 14, 1, 19, 7, 0]
// Resulting wiring: [2, 8, 15, 6, 16, 12, 4, 3, 11, 10, 18, 5, 13, 9, 17, 14, 1, 19, 7, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[13];
cx q[13], q[12];
cx q[17], q[12];
cx q[17], q[18];
cx q[15], q[16];
cx q[7], q[13];
cx q[6], q[12];
cx q[2], q[3];
