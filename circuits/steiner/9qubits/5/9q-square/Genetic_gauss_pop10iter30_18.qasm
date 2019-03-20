// Initial wiring: [0 7 5 1 2 4 3 6 8]
// Resulting wiring: [0 7 5 1 2 4 3 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[0];
cx q[2], q[1];
cx q[1], q[4];
cx q[2], q[3];
