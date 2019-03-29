// Initial wiring: [12, 5, 3, 10, 6, 11, 1, 15, 7, 14, 4, 0, 9, 13, 8, 2]
// Resulting wiring: [12, 5, 3, 10, 6, 11, 1, 15, 7, 14, 4, 0, 9, 13, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[3], q[2];
cx q[8], q[7];
cx q[10], q[9];
cx q[13], q[12];
cx q[15], q[14];
cx q[10], q[11];
cx q[1], q[2];
