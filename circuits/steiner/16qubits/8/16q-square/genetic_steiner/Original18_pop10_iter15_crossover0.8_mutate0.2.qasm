// Initial wiring: [6, 7, 5, 8, 4, 3, 15, 11, 10, 14, 9, 13, 12, 2, 0, 1]
// Resulting wiring: [6, 7, 5, 8, 4, 3, 15, 11, 10, 14, 9, 13, 12, 2, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[10], q[5];
cx q[11], q[10];
cx q[10], q[9];
cx q[10], q[5];
cx q[11], q[4];
cx q[14], q[13];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[15];
cx q[10], q[11];
cx q[9], q[10];
cx q[8], q[9];
cx q[9], q[10];
cx q[10], q[11];
cx q[10], q[9];
cx q[11], q[10];
cx q[6], q[7];
cx q[5], q[6];
