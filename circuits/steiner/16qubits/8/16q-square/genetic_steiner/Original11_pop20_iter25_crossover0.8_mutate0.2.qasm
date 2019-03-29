// Initial wiring: [13, 7, 15, 3, 8, 2, 6, 9, 14, 0, 11, 4, 10, 1, 5, 12]
// Resulting wiring: [13, 7, 15, 3, 8, 2, 6, 9, 14, 0, 11, 4, 10, 1, 5, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[4], q[3];
cx q[8], q[7];
cx q[7], q[6];
cx q[13], q[10];
cx q[10], q[9];
cx q[14], q[9];
cx q[6], q[7];
cx q[7], q[6];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[6];
