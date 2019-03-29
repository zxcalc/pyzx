// Initial wiring: [1, 3, 9, 5, 12, 7, 13, 4, 8, 10, 2, 14, 6, 11, 0, 15]
// Resulting wiring: [1, 3, 9, 5, 12, 7, 13, 4, 8, 10, 2, 14, 6, 11, 0, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[10], q[5];
cx q[14], q[13];
cx q[15], q[14];
cx q[10], q[11];
cx q[8], q[9];
cx q[6], q[7];
cx q[0], q[7];
