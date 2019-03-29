// Initial wiring: [14, 15, 6, 8, 0, 5, 4, 7, 9, 12, 2, 13, 11, 3, 1, 10]
// Resulting wiring: [14, 15, 6, 8, 0, 5, 4, 7, 9, 12, 2, 13, 11, 3, 1, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[3];
cx q[12], q[7];
cx q[10], q[15];
cx q[7], q[15];
cx q[2], q[3];
cx q[2], q[12];
cx q[3], q[9];
