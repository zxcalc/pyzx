// Initial wiring: [10, 7, 13, 0, 1, 8, 2, 4, 14, 11, 15, 5, 9, 6, 3, 12]
// Resulting wiring: [10, 7, 13, 0, 1, 8, 2, 4, 14, 11, 15, 5, 9, 6, 3, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[6];
cx q[8], q[7];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[9];
cx q[9], q[6];
cx q[6], q[5];
cx q[6], q[1];
cx q[9], q[6];
cx q[15], q[14];
cx q[9], q[10];
cx q[8], q[15];
cx q[4], q[5];
