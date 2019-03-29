// Initial wiring: [1, 5, 4, 3, 6, 15, 12, 0, 11, 2, 10, 9, 7, 14, 13, 8]
// Resulting wiring: [1, 5, 4, 3, 6, 15, 12, 0, 11, 2, 10, 9, 7, 14, 13, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[9], q[8];
cx q[8], q[3];
cx q[10], q[4];
cx q[14], q[12];
cx q[15], q[7];
cx q[10], q[12];
cx q[2], q[4];
cx q[3], q[12];
