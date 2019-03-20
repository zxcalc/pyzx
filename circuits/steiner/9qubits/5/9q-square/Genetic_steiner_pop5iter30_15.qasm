// Initial wiring: [7, 5, 3, 0, 8, 4, 1, 6, 2]
// Resulting wiring: [7, 5, 3, 0, 8, 4, 1, 6, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[7], q[6];
cx q[8], q[3];
cx q[4], q[3];
cx q[5], q[0];
