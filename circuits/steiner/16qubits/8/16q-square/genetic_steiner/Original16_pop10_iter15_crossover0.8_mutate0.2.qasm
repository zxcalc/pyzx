// Initial wiring: [14, 0, 3, 1, 12, 6, 11, 5, 7, 2, 13, 8, 15, 9, 10, 4]
// Resulting wiring: [14, 0, 3, 1, 12, 6, 11, 5, 7, 2, 13, 8, 15, 9, 10, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[5];
cx q[5], q[4];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[1];
cx q[8], q[7];
cx q[9], q[6];
cx q[6], q[1];
cx q[1], q[0];
cx q[6], q[1];
cx q[9], q[6];
cx q[15], q[14];
cx q[14], q[15];
cx q[9], q[14];
cx q[14], q[15];
cx q[15], q[14];
cx q[0], q[7];
