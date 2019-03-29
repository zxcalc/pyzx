// Initial wiring: [1, 3, 2, 5, 7, 4, 0, 6, 8, 15, 11, 14, 9, 13, 12, 10]
// Resulting wiring: [1, 3, 2, 5, 7, 4, 0, 6, 8, 15, 11, 14, 9, 13, 12, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[0];
cx q[8], q[2];
cx q[14], q[7];
cx q[15], q[7];
cx q[7], q[11];
cx q[8], q[15];
cx q[1], q[3];
cx q[0], q[1];
