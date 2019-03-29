// Initial wiring: [10, 16, 7, 17, 19, 15, 11, 14, 1, 13, 4, 2, 6, 12, 9, 18, 8, 5, 0, 3]
// Resulting wiring: [10, 16, 7, 17, 19, 15, 11, 14, 1, 13, 4, 2, 6, 12, 9, 18, 8, 5, 0, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[10];
cx q[13], q[12];
cx q[13], q[7];
cx q[16], q[14];
cx q[19], q[10];
cx q[16], q[17];
cx q[13], q[14];
cx q[9], q[10];
