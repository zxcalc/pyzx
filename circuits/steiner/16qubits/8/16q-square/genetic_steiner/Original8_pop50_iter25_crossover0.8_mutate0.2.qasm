// Initial wiring: [9, 8, 11, 5, 4, 15, 3, 14, 2, 12, 7, 1, 0, 13, 6, 10]
// Resulting wiring: [9, 8, 11, 5, 4, 15, 3, 14, 2, 12, 7, 1, 0, 13, 6, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[10], q[5];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[9];
cx q[9], q[6];
cx q[9], q[14];
cx q[8], q[9];
cx q[9], q[14];
cx q[14], q[9];
