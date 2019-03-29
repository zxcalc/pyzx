// Initial wiring: [2, 12, 1, 8, 7, 0, 6, 15, 10, 3, 5, 11, 4, 14, 13, 9]
// Resulting wiring: [2, 12, 1, 8, 7, 0, 6, 15, 10, 3, 5, 11, 4, 14, 13, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[6], q[5];
cx q[9], q[6];
cx q[6], q[5];
cx q[10], q[9];
cx q[9], q[6];
cx q[10], q[9];
cx q[13], q[12];
cx q[11], q[12];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[5];
