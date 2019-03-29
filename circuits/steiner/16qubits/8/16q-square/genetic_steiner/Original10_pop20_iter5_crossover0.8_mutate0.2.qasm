// Initial wiring: [2, 12, 9, 11, 14, 8, 1, 7, 6, 3, 5, 4, 10, 13, 0, 15]
// Resulting wiring: [2, 12, 9, 11, 14, 8, 1, 7, 6, 3, 5, 4, 10, 13, 0, 15]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[1], q[0];
cx q[10], q[9];
cx q[9], q[8];
cx q[10], q[9];
cx q[11], q[4];
cx q[14], q[9];
cx q[9], q[14];
cx q[14], q[15];
cx q[14], q[9];
cx q[8], q[15];
cx q[8], q[9];
cx q[7], q[8];
cx q[8], q[9];
cx q[9], q[14];
cx q[9], q[8];
cx q[14], q[9];
cx q[4], q[11];
cx q[11], q[4];
cx q[3], q[4];
cx q[4], q[11];
cx q[11], q[4];
