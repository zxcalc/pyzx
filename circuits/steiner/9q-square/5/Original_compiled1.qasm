// Initial wiring: [5 1 2 3 4 0 7 8 6]
// Resulting wiring: [5 0 2 3 4 1 7 8 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[2], q[1];
cx q[0], q[1];
cx q[0], q[1];
cx q[0], q[1];
cx q[2], q[1];
cx q[3], q[2];
cx q[7], q[6];
