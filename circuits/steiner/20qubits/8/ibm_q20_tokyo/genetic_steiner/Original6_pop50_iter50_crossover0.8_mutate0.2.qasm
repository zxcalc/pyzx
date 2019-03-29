// Initial wiring: [0, 12, 10, 18, 19, 16, 14, 2, 9, 4, 11, 13, 1, 6, 17, 7, 8, 3, 15, 5]
// Resulting wiring: [0, 12, 10, 18, 19, 16, 14, 2, 9, 4, 11, 13, 1, 6, 17, 7, 8, 3, 15, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[6], q[4];
cx q[12], q[7];
cx q[15], q[14];
cx q[15], q[13];
cx q[17], q[12];
cx q[12], q[13];
cx q[11], q[18];
cx q[3], q[6];
