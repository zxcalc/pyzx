// Initial wiring: [1, 5, 4, 14, 10, 3, 13, 18, 17, 12, 11, 16, 8, 0, 19, 2, 15, 9, 7, 6]
// Resulting wiring: [1, 5, 4, 14, 10, 3, 13, 18, 17, 12, 11, 16, 8, 0, 19, 2, 15, 9, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[5], q[3];
cx q[10], q[9];
cx q[16], q[17];
cx q[13], q[14];
cx q[7], q[12];
cx q[1], q[7];
cx q[1], q[2];
