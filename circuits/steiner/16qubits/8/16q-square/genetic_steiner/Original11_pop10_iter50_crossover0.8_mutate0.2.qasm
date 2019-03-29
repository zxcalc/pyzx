// Initial wiring: [14, 9, 12, 7, 13, 15, 0, 5, 4, 2, 11, 1, 10, 3, 6, 8]
// Resulting wiring: [14, 9, 12, 7, 13, 15, 0, 5, 4, 2, 11, 1, 10, 3, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[9], q[6];
cx q[11], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[6], q[1];
cx q[10], q[9];
cx q[14], q[9];
cx q[9], q[6];
cx q[6], q[1];
cx q[14], q[13];
cx q[9], q[6];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[13];
cx q[15], q[14];
cx q[3], q[4];
cx q[0], q[1];
