// Initial wiring: [5, 4, 6, 14, 10, 16, 19, 7, 17, 18, 2, 15, 8, 3, 12, 13, 11, 9, 0, 1]
// Resulting wiring: [5, 4, 6, 14, 10, 16, 19, 7, 17, 18, 2, 15, 8, 3, 12, 13, 11, 9, 0, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[0];
cx q[15], q[7];
cx q[18], q[2];
cx q[6], q[13];
