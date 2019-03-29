// Initial wiring: [12, 4, 15, 5, 13, 7, 1, 8, 9, 14, 2, 10, 0, 6, 3, 11]
// Resulting wiring: [12, 4, 15, 5, 13, 7, 1, 8, 9, 14, 2, 10, 0, 6, 3, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[13], q[7];
cx q[14], q[7];
cx q[7], q[0];
cx q[15], q[5];
cx q[13], q[15];
cx q[10], q[11];
cx q[5], q[11];
