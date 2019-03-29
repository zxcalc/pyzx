// Initial wiring: [5, 11, 2, 13, 7, 12, 9, 15, 4, 0, 3, 6, 14, 10, 1, 8]
// Resulting wiring: [5, 11, 2, 13, 7, 12, 9, 15, 4, 0, 3, 6, 14, 10, 1, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[6], q[5];
cx q[5], q[2];
cx q[7], q[6];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[1];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[6];
cx q[6], q[1];
cx q[7], q[6];
cx q[8], q[7];
cx q[11], q[4];
cx q[12], q[11];
cx q[11], q[4];
cx q[12], q[11];
cx q[14], q[13];
cx q[10], q[11];
cx q[9], q[14];
