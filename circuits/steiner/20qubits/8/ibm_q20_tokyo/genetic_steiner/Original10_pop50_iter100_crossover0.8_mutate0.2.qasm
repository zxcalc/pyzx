// Initial wiring: [3, 17, 14, 9, 0, 19, 2, 5, 13, 15, 10, 1, 18, 4, 7, 6, 12, 16, 11, 8]
// Resulting wiring: [3, 17, 14, 9, 0, 19, 2, 5, 13, 15, 10, 1, 18, 4, 7, 6, 12, 16, 11, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[3];
cx q[8], q[2];
cx q[13], q[7];
cx q[13], q[6];
cx q[18], q[17];
cx q[16], q[17];
cx q[8], q[9];
cx q[3], q[4];
