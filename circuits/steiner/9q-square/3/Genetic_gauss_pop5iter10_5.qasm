// Initial wiring: [0 1 2 8 4 5 6 7 3]
// Resulting wiring: [0 4 2 8 1 5 6 7 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[4], q[3];
cx q[4], q[5];
