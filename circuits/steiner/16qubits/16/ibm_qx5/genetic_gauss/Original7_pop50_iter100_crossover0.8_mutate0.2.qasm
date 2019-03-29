// Initial wiring: [1, 11, 14, 13, 10, 12, 8, 7, 0, 15, 2, 5, 3, 6, 4, 9]
// Resulting wiring: [1, 11, 14, 13, 10, 12, 8, 7, 0, 15, 2, 5, 3, 6, 4, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[0];
cx q[11], q[3];
cx q[15], q[1];
cx q[14], q[5];
cx q[12], q[11];
cx q[7], q[12];
cx q[7], q[9];
cx q[6], q[7];
cx q[11], q[13];
cx q[0], q[3];
cx q[4], q[11];
cx q[4], q[9];
cx q[1], q[6];
